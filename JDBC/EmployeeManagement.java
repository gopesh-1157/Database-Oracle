package dbms;

import javax.swing.*;
import javax.swing.border.*;
import javax.swing.table.*;
import java.awt.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class EmployeeManagement extends JFrame {

    // --- Database Configuration ---
    private static final String DB_URL = "jdbc:oracle:thin:@Gopesh:1521:XE";
    private static final String DB_USER = "system";
    private static final String DB_PASS = "Rsg_1157";

    // --- UI Styling ---
    private static final Color BG_WINDOW = new Color(241, 245, 249);
    private static final Color BG_CARD = Color.WHITE;
    private static final Color ACCENT = new Color(37, 99, 235);
    private static final Color SUCCESS = new Color(34, 197, 94);
    private static final Color DANGER = new Color(239, 68, 68);
    private static final Color WARNING = new Color(245, 158, 11);
    private static final Font FONT_TITLE = new Font("Segoe UI", Font.BOLD, 22);
    private static final Font FONT_LABEL = new Font("Segoe UI", Font.BOLD, 12);
    private static final Font FONT_INPUT = new Font("Segoe UI", Font.PLAIN, 13);

    // --- Components ---
    private JTextField insEmpId, insName, insSalary, insRole, insMail;
    private JTextField updEmpId, updName, updSalary, updRole, updMail;
    private JTextField delEmpId;
    private DefaultTableModel viewTableModel;
    private JLabel statusLabel;

    public EmployeeManagement() {
        setTitle("Employee Management System • Secure Version");
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setSize(1150, 750);
        setLocationRelativeTo(null);
        getContentPane().setBackground(BG_WINDOW);
        setLayout(new BorderLayout());

        buildHeader();
        buildTabs();
        buildStatusBar();
        setVisible(true);
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
    }

    // --- SHARED ERROR HANDLING (Handles ORA-00001) ---
 // ---------------- ERROR HANDLING ----------------
    private void handleError(String ctx, Exception e) {
        String msg;

        if (e instanceof NumberFormatException)
            msg = "Invalid number (ID/Salary must be numeric)";
        else if (e instanceof SQLIntegrityConstraintViolationException)
            msg = "Employee ID already exists!";
        else if (e instanceof SQLException)
            msg = "Database Error: " + e.getMessage();
        else if (e instanceof NullPointerException)
            msg = "System error (null value)";
        else
            msg = e.getMessage();

        setStatus("✖ " + ctx + ": " + msg, DANGER);
        JOptionPane.showMessageDialog(this, msg, ctx, JOptionPane.ERROR_MESSAGE);
    }

    private void setStatus(String m, Color c) {
        statusLabel.setText(m);
        statusLabel.setForeground(c);
    }

    // --- 1. UI INSERT LOGIC ---
    private void doInsert() {
        try {
            if (insEmpId.getText().isBlank() || insSalary.getText().isBlank() || insMail.getText().isBlank())
                throw new Exception("ID, Salary, and Email are mandatory!");

            String name = insName.getText().trim();
            String role = insRole.getText().trim();
            if (!name.isEmpty() && !name.matches("^[a-zA-Z\\s]*$")) throw new Exception("Name must contain letters only!");
            if (!role.isEmpty() && !role.matches("^[a-zA-Z\\s]*$")) throw new Exception("Role must contain letters only!");
            if (!insMail.getText().matches("^[A-Za-z0-9+_.-]+@(.+)$")) throw new Exception("Invalid Email format!");

            try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO EMPLOYEE (EMPLOYEE_ID, NAME, SALARY, ROLE, MAIL) VALUES (?, ?, ?, ?, ?)")) {
                ps.setInt(1, Integer.parseInt(insEmpId.getText().trim()));
                ps.setString(2, name);
                ps.setDouble(3, Double.parseDouble(insSalary.getText().trim()));
                ps.setString(4, role);
                ps.setString(5, insMail.getText().trim());
                ps.executeUpdate();
                setStatus("✔ Record Inserted Successfully", SUCCESS);
            }
        } catch (Exception ex) { handleError("Insert Error", ex); }
    }

    // --- 2. UI UPDATE LOGIC (DYNAMIC) ---
    private void doUpdate() {
        try {
            if (updEmpId.getText().isBlank()) throw new Exception("ID is required for update.");
            int id = Integer.parseInt(updEmpId.getText().trim());

            StringBuilder sql = new StringBuilder("UPDATE EMPLOYEE SET ");
            List<Object> vals = new ArrayList<>();
            String name = updName.getText().trim(), sal = updSalary.getText().trim();
            String role = updRole.getText().trim(), mail = updMail.getText().trim();

            if (!name.isEmpty()) {
                if (!name.matches("^[a-zA-Z\\s]*$")) throw new Exception("Letters only for Name!");
                sql.append("NAME=?, "); vals.add(name);
            }
            if (!sal.isEmpty()) {
                sql.append("SALARY=?, "); vals.add(Double.parseDouble(sal));
            }
            if (!role.isEmpty()) {
                if (!role.matches("^[a-zA-Z\\s]*$")) throw new Exception("Letters only for Role!");
                sql.append("ROLE=?, "); vals.add(role);
            }
            if (!mail.isEmpty()) {
                if (!mail.matches("^[A-Za-z0-9+_.-]+@(.+)$")) throw new Exception("Invalid Email!");
                sql.append("MAIL=?, "); vals.add(mail);
            }

            if (vals.isEmpty()) throw new Exception("No changes provided.");
            sql.setLength(sql.length() - 2); sql.append(" WHERE EMPLOYEE_ID = ?");
            vals.add(id);

            try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql.toString())) {
                for (int i = 0; i < vals.size(); i++) ps.setObject(i + 1, vals.get(i));
                if (ps.executeUpdate() > 0) setStatus("✔ Update Successful", SUCCESS);
                else setStatus("⚠ ID not found", WARNING);
            }
        } catch (Exception ex) { handleError("Update Error", ex); }
    }

    // --- 3. UI DELETE LOGIC ---
    private void doDelete() {
        try {
            int id = Integer.parseInt(delEmpId.getText().trim());
            int confirm = JOptionPane.showConfirmDialog(this, "Delete ID " + id + "?", "Confirm", JOptionPane.YES_NO_OPTION);
            if (confirm != JOptionPane.YES_OPTION) return;

            try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement("DELETE FROM EMPLOYEE WHERE EMPLOYEE_ID = ?")) {
                ps.setInt(1, id);
                if (ps.executeUpdate() > 0) setStatus("✔ Deleted Successfully", SUCCESS);
                else setStatus("⚠ ID Not Found", WARNING);
            }
        } catch (Exception ex) { handleError("Delete Error", ex); }
    }

    // --- 4. CONSOLE OPERATION (ALL OPERATIONS) ---
    public void startConsoleMenu() {
        Scanner sc = new Scanner(System.in);
        while (true) {
            System.out.println("\n--- CONSOLE SYSTEM ---");
            System.out.print("1.Insert 2.Update 3.Delete 4.Exit Console > ");
            String c = sc.nextLine();
            if (c.equals("4")) break;

            try {
                if (c.equals("1")) { // Console Insert
                    System.out.print("ID: "); int id = Integer.parseInt(sc.nextLine());
                    System.out.print("Name: "); String n = sc.nextLine();
                    System.out.print("Salary: "); double s = Double.parseDouble(sc.nextLine());
                    if (!n.matches("^[a-zA-Z\\s]*$")) throw new Exception("Name letters only!");
                    
                    try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement("INSERT INTO EMPLOYEE (EMPLOYEE_ID, NAME, SALARY) VALUES (?,?,?)")) {
                        ps.setInt(1, id); ps.setString(2, n); ps.setDouble(3, s);
                        ps.executeUpdate();
                        System.out.println("✔ Saved via Console.");
                    }
                } else if (c.equals("3")) { // Console Delete
                    System.out.print("ID to Delete: "); int id = Integer.parseInt(sc.nextLine());
                    try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement("DELETE FROM EMPLOYEE WHERE EMPLOYEE_ID = ?")) {
                        ps.setInt(1, id);
                        if(ps.executeUpdate() > 0) System.out.println("✔ Deleted.");
                        else System.out.println("⚠ ID Not Found.");
                    }
                }
            } catch (SQLException e) {
                if (e.getErrorCode() == 1) System.out.println("✖ Error: ID Already Exists.");
                else System.out.println("✖ DB Error: " + e.getMessage());
            } catch (Exception e) { System.out.println("✖ Error: " + e.getMessage()); }
        }
    }

    // --- UI DESIGN & TABS [0.1.6-0.1.20] ---
    private void buildTabs() {
        JTabbedPane tabs = new JTabbedPane();
        tabs.addTab("Insert", buildInsertPanel());
        tabs.addTab("Update", buildUpdatePanel());
        tabs.addTab("Delete", buildDeletePanel());
        tabs.addTab("View", buildViewPanel());
        add(tabs, BorderLayout.CENTER);
    }

    private JPanel buildUpdatePanel() {
        JPanel p = new JPanel(new GridBagLayout()); p.setBackground(BG_CARD);
        GridBagConstraints g = new GridBagConstraints(); g.insets = new Insets(10, 15, 10, 15); g.fill = GridBagConstraints.HORIZONTAL;

        g.gridx = 0; g.gridy = 0; p.add(new JLabel("Employee ID *"), g);
        g.gridx = 1; updEmpId = new JTextField(15); p.add(updEmpId, g);
        g.gridx = 2; JButton load = new JButton("Load Data"); load.addActionListener(e -> loadDataForUpdate()); p.add(load, g);

        g.gridx = 0; g.gridy = 1; p.add(new JLabel("Name"), g);
        g.gridx = 1; updName = new JTextField(15); p.add(updName, g);
        g.gridx = 2; p.add(new JLabel("Role"), g);
        g.gridx = 3; updRole = new JTextField(15); p.add(updRole, g);

        g.gridx = 0; g.gridy = 2; p.add(new JLabel("Salary"), g);
        g.gridx = 1; updSalary = new JTextField(15); p.add(updSalary, g);
        g.gridx = 2; p.add(new JLabel("Email"), g);
        g.gridx = 3; updMail = new JTextField(15); p.add(updMail, g);

        JButton btn = new JButton("Update Employee Record");
        btn.setPreferredSize(new Dimension(0, 50)); btn.setBackground(WARNING); btn.setForeground(Color.WHITE);
        btn.addActionListener(e -> doUpdate());

        JPanel wrap = new JPanel(new BorderLayout()); wrap.add(p, BorderLayout.CENTER); wrap.add(btn, BorderLayout.SOUTH);
        return wrap;
    }

    private void loadDataForUpdate() {
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement("SELECT NAME, SALARY, ROLE, MAIL FROM EMPLOYEE WHERE EMPLOYEE_ID = ?")) {
            ps.setInt(1, Integer.parseInt(updEmpId.getText().trim()));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                updName.setText(rs.getString(1)); updSalary.setText(rs.getString(2));
                updRole.setText(rs.getString(3)); updMail.setText(rs.getString(4));
                setStatus("✔ Data Loaded", SUCCESS);
            } else setStatus("⚠ ID Not Found", WARNING);
        } catch (Exception ex) { handleError("Load Error", ex); }
    }

    private JPanel buildInsertPanel() {
        JPanel p = new JPanel(new GridBagLayout()); p.setBackground(BG_CARD);
        GridBagConstraints g = new GridBagConstraints(); g.insets = new Insets(10, 15, 10, 15); g.fill = GridBagConstraints.HORIZONTAL;
        g.gridx = 0; g.gridy = 0; p.add(new JLabel("Employee ID *"), g);
        g.gridx = 1; insEmpId = new JTextField(15); p.add(insEmpId, g);
        g.gridx = 2; p.add(new JLabel("Role"), g);
        g.gridx = 3; insRole = new JTextField(15); p.add(insRole, g);
        g.gridx = 0; g.gridy = 1; p.add(new JLabel("Name"), g);
        g.gridx = 1; insName = new JTextField(15); p.add(insName, g);
        g.gridx = 2; p.add(new JLabel("Email *"), g);
        g.gridx = 3; insMail = new JTextField(15); p.add(insMail, g);
        g.gridx = 0; g.gridy = 2; p.add(new JLabel("Salary *"), g);
        g.gridx = 1; insSalary = new JTextField(15); p.add(insSalary, g);
        JButton btn = new JButton("Insert Employee");
        btn.setPreferredSize(new Dimension(0, 50)); btn.setBackground(SUCCESS); btn.setForeground(Color.WHITE);
        btn.addActionListener(e -> doInsert());
        JPanel wrap = new JPanel(new BorderLayout()); wrap.add(p, BorderLayout.CENTER); wrap.add(btn, BorderLayout.SOUTH);
        return wrap;
    }

    private JPanel buildDeletePanel() {
        JPanel p = new JPanel(); delEmpId = new JTextField(15);
        JButton btn = new JButton("Delete Record"); btn.setBackground(DANGER); btn.setForeground(Color.WHITE);
        btn.addActionListener(e -> doDelete());
        p.add(new JLabel("ID:")); p.add(delEmpId); p.add(btn);
        return p;
    }
    private void loadTableData() {
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM EMPLOYEE");
             ResultSet rs = ps.executeQuery()) {

            viewTableModel.setRowCount(0); // clear old data

            while (rs.next()) {
                viewTableModel.addRow(new Object[]{
                        rs.getInt("EMPLOYEE_ID"),
                        rs.getString("NAME"),
                        rs.getString("ROLE"),
                        rs.getDouble("SALARY"),
                        rs.getString("MAIL")
                });
            }

            setStatus("✔ Data Loaded Successfully", SUCCESS);

        } catch (Exception e) {
            handleError("View Error", e);
        }
    }
    private JPanel buildViewPanel() {

        viewTableModel = new DefaultTableModel(
                new String[]{"ID", "Name", "Role", "Salary", "Email"}, 0
        );

        JTable table = new JTable(viewTableModel);

        JButton refreshBtn = new JButton("Refresh Data");
        refreshBtn.setBackground(ACCENT);
        refreshBtn.setForeground(Color.WHITE);

        refreshBtn.addActionListener(e -> loadTableData());

        JPanel panel = new JPanel(new BorderLayout());
        panel.add(new JScrollPane(table), BorderLayout.CENTER);
        panel.add(refreshBtn, BorderLayout.SOUTH);

        return panel;
    }
    private void buildHeader() {
        JPanel h = new JPanel(new FlowLayout(FlowLayout.LEFT)); h.setBackground(BG_CARD);
        JLabel title = new JLabel("Employee Management System"); title.setFont(FONT_TITLE); title.setForeground(ACCENT);
        h.add(title); add(h, BorderLayout.NORTH);
    }

    private void buildStatusBar() {
        statusLabel = new JLabel("System Ready");
        JPanel bar = new JPanel(new FlowLayout(FlowLayout.LEFT)); bar.setBackground(BG_CARD);
        bar.add(statusLabel); add(bar, BorderLayout.SOUTH);
    }

    public static void main(String[] args) {
        try { Class.forName("oracle.jdbc.driver.OracleDriver"); } catch (Exception e) {}
        SwingUtilities.invokeLater(() -> {
            EmployeeManagement app = new EmployeeManagement();
            // Start Console in a separate thread [Added Console Threading]
            new Thread(app::startConsoleMenu).start();
        });
    }
}
