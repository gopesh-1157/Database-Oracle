package dbms;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.*;


public class ShopManagementSystem extends JFrame {

    public ShopManagementSystem() {
        setTitle("Shop Management System");
        setSize(1000, 560);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JTabbedPane tabs = new JTabbedPane();
        tabs.addTab("Customer Registration", new CustomerPanel());
        tabs.addTab("Admin: Products",        new AdminProductPanel());
        tabs.addTab("Place Order",             new InventoryPanel());
        tabs.addTab("Order Items",             new OrderItemsPanel());
        tabs.addTab("Product Details",         new ProductDetailsPanel());
        tabs.addTab("Product Search",          new ProductDisplayPanel());

        add(tabs);
        setVisible(true);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(ShopManagementSystem::new);
    }

    // =========================================================
    //  DB CONNECTION
    // =========================================================
    static class DBConnection {
        private static final String URL  = "jdbc:oracle:thin:@Gopesh:1521:XE";
        private static final String USER = "system";
        private static final String PASS = "Rsg_1157";

        static Connection getConnection() {
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                return DriverManager.getConnection(URL, USER, PASS);
            } catch (ClassNotFoundException e) {
                System.out.println("Driver not found!");
            } catch (SQLException e) {
                System.out.println("Connection failed: " + e.getMessage());
            }
            return null;
        }
    }

    // =========================================================
    //  TAB 1 — CUSTOMER REGISTRATION
    // =========================================================
    static class CustomerPanel extends JPanel {

        JTextField     txtName, txtEmail, txtPhone;
        JPasswordField txtPassword;
        JTextArea      txtAddress;
        JTable         table;
        DefaultTableModel model;
        Connection     con;

        CustomerPanel() {
            setLayout(new BorderLayout(10, 10));

            JPanel formPanel = new JPanel(new GridLayout(5, 2, 8, 8));
            formPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

            txtName     = new JTextField();
            txtEmail    = new JTextField();
            txtPhone    = new JTextField();
            txtPassword = new JPasswordField();
            txtAddress  = new JTextArea();
            txtAddress.setLineWrap(true);

            formPanel.add(new JLabel("Name"));     formPanel.add(txtName);
            formPanel.add(new JLabel("Email"));    formPanel.add(txtEmail);
            formPanel.add(new JLabel("Phone"));    formPanel.add(txtPhone);
            formPanel.add(new JLabel("Password")); formPanel.add(txtPassword);
            formPanel.add(new JLabel("Address"));  formPanel.add(new JScrollPane(txtAddress));

            model = new DefaultTableModel(
                    new String[]{"ID", "Name", "Email", "Phone", "Password", "Address"}, 0);
            table = new JTable(model);

            JPanel rightPanel = new JPanel(new BorderLayout());
            rightPanel.add(new JLabel("Customer Records", SwingConstants.CENTER), BorderLayout.NORTH);
            rightPanel.add(new JScrollPane(table), BorderLayout.CENTER);

            add(formPanel,  BorderLayout.WEST);
            add(rightPanel, BorderLayout.CENTER);

            JButton btnRegister = new JButton("Register");
            JPanel  btnPanel    = new JPanel();
            btnPanel.add(btnRegister);
            add(btnPanel, BorderLayout.SOUTH);

            con = DBConnection.getConnection();
            if (con == null) {
                JOptionPane.showMessageDialog(this, "Database connection failed.");
            } else {
                loadTable();
            }

            btnRegister.addActionListener(e -> {
                try {
                    if (con == null) return;
                    if (!validateInputs()) return;

                    int nextId = 1;
                    try (Statement s = con.createStatement();
                         ResultSet rs = s.executeQuery("SELECT NVL(MAX(customer_id),0)+1 FROM Customers")) {
                        if (rs.next()) nextId = rs.getInt(1);
                    }

                    PreparedStatement ps = con.prepareStatement(
                            "INSERT INTO Customers VALUES (?, ?, ?, ?, ?, ?, ?)");
                    ps.setInt(1, nextId);
                    ps.setString(2, txtName.getText().trim());
                    ps.setString(3, txtEmail.getText().trim());
                    ps.setString(4, txtPhone.getText().trim());
                    ps.setString(5, new String(txtPassword.getPassword()).trim());
                    ps.setString(6, txtAddress.getText().trim());
                    ps.setDate(7, new java.sql.Date(System.currentTimeMillis()));
                    ps.executeUpdate();

                    JOptionPane.showMessageDialog(this, "Registered Successfully!");
                    loadTable();
                    clearFields();
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(this, "DB Error: " + ex.getMessage());
                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(this, "Error: " + ex.getMessage());
                }
            });
        }

        boolean validateInputs() {
            String name     = txtName.getText().trim();
            String email    = txtEmail.getText().trim();
            String phone    = txtPhone.getText().trim();
            String password = new String(txtPassword.getPassword()).trim();
            String address  = txtAddress.getText().trim();

            if (name.isEmpty()) {
                JOptionPane.showMessageDialog(this, "Name cannot be empty"); return false;
            }
            if (!name.matches("[a-zA-Z ]+")) {
                JOptionPane.showMessageDialog(this, "Name must contain only letters"); return false;
            }
            if (!isValidEmail(email)) return false;
            if (!phone.matches("\\d{10}")) {
                JOptionPane.showMessageDialog(this, "Phone must be 10 digits"); return false;
            }
            if (!isValidPassword(password)) {
                JOptionPane.showMessageDialog(this,
                        "Password must be >=8 chars with a number and special character");
                return false;
            }
            if (address.isEmpty()) {
                JOptionPane.showMessageDialog(this, "Address cannot be empty"); return false;
            }
            return true;
        }

        boolean isValidEmail(String email) {
            if (email == null || !email.toLowerCase().matches("^[a-z0-9+_.-]+@gmail\\.(com|in)$")) {
                JOptionPane.showMessageDialog(this, "Use Gmail only (@gmail.com or @gmail.in)");
                return false;
            }
            return true;
        }

        boolean isValidPassword(String password) {
            return password != null && password.matches("(?=.*\\d)(?=.*[^A-Za-z0-9]).{8,}");
        }

        void loadTable() {
            try {
                model.setRowCount(0);
                PreparedStatement ps = con.prepareStatement(
                        "SELECT customer_id, name, email, phone, password, address FROM Customers ORDER BY customer_id");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    model.addRow(new Object[]{
                            rs.getInt(1), rs.getString(2), rs.getString(3),
                            rs.getString(4), rs.getString(5), rs.getString(6)
                    });
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(this, "Load Error: " + e.getMessage());
            }
        }

        void clearFields() {
            txtName.setText(""); txtEmail.setText(""); txtPhone.setText("");
            txtPassword.setText(""); txtAddress.setText("");
        }

    } // end CustomerPanel

    // =========================================================
    //  TAB 2 — ADMIN PRODUCT DASHBOARD
    // =========================================================
    static class AdminProductPanel extends JPanel {

        JTextField txtName, txtCategory, txtPrice, txtStock;
        JTextArea  txtDescription;
        JTable     table;
        DefaultTableModel model;
        Connection con;
        int selectedProductId = -1;

        AdminProductPanel() {
            setLayout(new BorderLayout(10, 10));

            JPanel formPanel = new JPanel(new GridLayout(5, 2, 8, 8));
            formPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

            txtName        = new JTextField();
            txtCategory    = new JTextField();
            txtPrice       = new JTextField();
            txtStock       = new JTextField();
            txtDescription = new JTextArea();
            txtDescription.setLineWrap(true);

            formPanel.add(new JLabel("Product Name"));  formPanel.add(txtName);
            formPanel.add(new JLabel("Category"));       formPanel.add(txtCategory);
            formPanel.add(new JLabel("Price"));          formPanel.add(txtPrice);
            formPanel.add(new JLabel("Stock Quantity")); formPanel.add(txtStock);
            formPanel.add(new JLabel("Description"));    formPanel.add(new JScrollPane(txtDescription));

            model = new DefaultTableModel(
                    new String[]{"Product ID", "Product Name", "Category", "Price", "Stock Qty", "Description"}, 0);
            table = new JTable(model);

            JPanel rightPanel = new JPanel(new BorderLayout());
            rightPanel.add(new JLabel("Product Records", SwingConstants.CENTER), BorderLayout.NORTH);
            rightPanel.add(new JScrollPane(table), BorderLayout.CENTER);

            add(formPanel,  BorderLayout.WEST);
            add(rightPanel, BorderLayout.CENTER);

            JButton btnAdd    = new JButton("Add");
            JButton btnUpdate = new JButton("Update");
            JButton btnDelete = new JButton("Delete");
            JButton btnClear  = new JButton("Clear");

            JPanel btnPanel = new JPanel(new FlowLayout(FlowLayout.CENTER, 12, 10));
            btnPanel.add(btnAdd); btnPanel.add(btnUpdate);
            btnPanel.add(btnDelete); btnPanel.add(btnClear);
            add(btnPanel, BorderLayout.SOUTH);

            con = DBConnection.getConnection();
            if (con == null) {
                JOptionPane.showMessageDialog(this, "Database connection failed.");
            } else {
                loadTable();
            }

            table.addMouseListener(new java.awt.event.MouseAdapter() {
                public void mouseClicked(java.awt.event.MouseEvent evt) {
                    int row = table.getSelectedRow();
                    if (row >= 0) {
                        selectedProductId = Integer.parseInt(model.getValueAt(row, 0).toString());
                        txtName.setText(model.getValueAt(row, 1).toString());
                        txtCategory.setText(model.getValueAt(row, 2).toString());
                        txtPrice.setText(model.getValueAt(row, 3).toString());
                        txtStock.setText(model.getValueAt(row, 4).toString());
                        txtDescription.setText(model.getValueAt(row, 5).toString());
                    }
                }
            });

            btnAdd.addActionListener(e -> {
                try {
                    if (con == null) return;
                    if (!validateInputs()) return;

                    int nextId = 1;
                    try (Statement s = con.createStatement();
                         ResultSet rs = s.executeQuery("SELECT NVL(MAX(product_id),0)+1 FROM products1")) {
                        if (rs.next()) nextId = rs.getInt(1);
                    }

                    PreparedStatement ps = con.prepareStatement(
                            "INSERT INTO products1 VALUES (?, ?, ?, ?, ?, ?)");
                    ps.setInt(1, nextId);
                    ps.setString(2, txtName.getText().trim());
                    ps.setString(3, txtCategory.getText().trim());
                    ps.setDouble(4, Double.parseDouble(txtPrice.getText().trim()));
                    ps.setInt(5, Integer.parseInt(txtStock.getText().trim()));
                    ps.setString(6, txtDescription.getText().trim());
                    ps.executeUpdate();

                    JOptionPane.showMessageDialog(this, "Product Added Successfully!");
                    loadTable(); clearFields();
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(this, "DB Error: " + ex.getMessage());
                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(this, "Error: " + ex.getMessage());
                }
            });

            btnUpdate.addActionListener(e -> {
                if (selectedProductId == -1) {
                    JOptionPane.showMessageDialog(this, "Select a product first."); return;
                }
                try {
                    if (con == null) return;
                    if (!validateInputs()) return;

                    PreparedStatement ps = con.prepareStatement(
                            "UPDATE products1 SET product_name=?, category=?, price=?, stock_quantity=?, description=? WHERE product_id=?");
                    ps.setString(1, txtName.getText().trim());
                    ps.setString(2, txtCategory.getText().trim());
                    ps.setDouble(3, Double.parseDouble(txtPrice.getText().trim()));
                    ps.setInt(4, Integer.parseInt(txtStock.getText().trim()));
                    ps.setString(5, txtDescription.getText().trim());
                    ps.setInt(6, selectedProductId);
                    ps.executeUpdate();

                    JOptionPane.showMessageDialog(this, "Product Updated!");
                    loadTable(); clearFields();
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(this, "DB Error: " + ex.getMessage());
                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(this, "Error: " + ex.getMessage());
                }
            });

            btnDelete.addActionListener(e -> {
                if (selectedProductId == -1) {
                    JOptionPane.showMessageDialog(this, "Select a product first."); return;
                }
                try {
                    if (con == null) return;
                    int confirm = JOptionPane.showConfirmDialog(this,
                            "Are you sure to delete?", "Confirm", JOptionPane.YES_NO_OPTION);
                    if (confirm != JOptionPane.YES_OPTION) return;

                    PreparedStatement ps = con.prepareStatement(
                            "DELETE FROM products1 WHERE product_id=?");
                    ps.setInt(1, selectedProductId);
                    ps.executeUpdate();

                    JOptionPane.showMessageDialog(this, "Deleted Successfully!");
                    loadTable(); clearFields();
                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(this, "Delete Error: " + ex.getMessage());
                }
            });

            btnClear.addActionListener(e -> clearFields());
        }

        boolean validateInputs() {
            if (txtName.getText().trim().isEmpty()) {
                JOptionPane.showMessageDialog(this, "Name cannot be empty"); return false;
            }
            if (!txtName.getText().trim().matches("[a-zA-Z ]+")) {
                JOptionPane.showMessageDialog(this, "Name must contain only letters"); return false;
            }
            if (txtCategory.getText().trim().isEmpty()) {
                JOptionPane.showMessageDialog(this, "Category cannot be empty"); return false;
            }
            try {
                double price = Double.parseDouble(txtPrice.getText().trim());
                if (price < 0) { JOptionPane.showMessageDialog(this, "Price must be positive"); return false; }
            } catch (NumberFormatException e) {
                JOptionPane.showMessageDialog(this, "Invalid Price (numbers only)"); return false;
            }
            try {
                int stock = Integer.parseInt(txtStock.getText().trim());
                if (stock < 0) { JOptionPane.showMessageDialog(this, "Stock must be positive"); return false; }
            } catch (NumberFormatException e) {
                JOptionPane.showMessageDialog(this, "Invalid Stock (integer only)"); return false;
            }
            if (txtDescription.getText().trim().isEmpty()) {
                JOptionPane.showMessageDialog(this, "Description cannot be empty"); return false;
            }
            return true;
        }

        void loadTable() {
            try {
                if (con == null) return;
                model.setRowCount(0);
                PreparedStatement ps = con.prepareStatement(
                        "SELECT * FROM products1 ORDER BY product_id");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    model.addRow(new Object[]{
                            rs.getInt(1), rs.getString(2), rs.getString(3),
                            rs.getDouble(4), rs.getInt(5), rs.getString(6)
                    });
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(this, "Load Error: " + e.getMessage());
            }
        }

        void clearFields() {
            txtName.setText(""); txtCategory.setText(""); txtPrice.setText("");
            txtStock.setText(""); txtDescription.setText("");
            selectedProductId = -1;
            table.clearSelection();
        }

    } // end AdminProductPanel

    // =========================================================
    //  TAB 3 — PLACE ORDER (INVENTORY)
    // =========================================================
    static class InventoryPanel extends JPanel {

        JTextField txtCustomerId, txtProductId, txtQuantity;
        JTable productTable;
        DefaultTableModel productModel;
        Connection con;

        InventoryPanel() {
            setLayout(new BorderLayout(10, 10));

            JPanel formPanel = new JPanel(new GridLayout(5, 2, 8, 8));
            formPanel.setBorder(BorderFactory.createTitledBorder("Place Order"));

            txtCustomerId = new JTextField();
            txtProductId = new JTextField();
            txtQuantity = new JTextField();

            formPanel.add(new JLabel("Customer ID")); formPanel.add(txtCustomerId);
            formPanel.add(new JLabel("Product ID"));  formPanel.add(txtProductId);
            formPanel.add(new JLabel("Quantity"));    formPanel.add(txtQuantity);

            JButton btnPlaceOrder = new JButton("Place Order");
            JButton btnClear = new JButton("Clear");

            formPanel.add(btnPlaceOrder);
            formPanel.add(btnClear);

            add(formPanel, BorderLayout.WEST);

            productModel = new DefaultTableModel(
                    new String[]{"Product ID", "Product Name", "Category", "Price", "Stock"}, 0);
            productTable = new JTable(productModel);
            add(new JScrollPane(productTable), BorderLayout.CENTER);

            con = DBConnection.getConnection();
            loadInventory();

            productTable.addMouseListener(new java.awt.event.MouseAdapter() {
                public void mouseClicked(java.awt.event.MouseEvent evt) {
                    int row = productTable.getSelectedRow();
                    if (row >= 0) {
                        txtProductId.setText(productModel.getValueAt(row, 0).toString());
                    }
                }
            });

            // ================= PLACE ORDER =================
            btnPlaceOrder.addActionListener(e -> {
                try {
                    int customerId = Integer.parseInt(txtCustomerId.getText().trim());
                    int productId = Integer.parseInt(txtProductId.getText().trim());
                    int quantity = Integer.parseInt(txtQuantity.getText().trim());

                    if (quantity <= 0) {
                        JOptionPane.showMessageDialog(this, "Invalid Quantity");
                        return;
                    }

                    PreparedStatement ps = con.prepareStatement(
                            "SELECT product_name, stock_quantity, price FROM products1 WHERE product_id=?");
                    ps.setInt(1, productId);
                    ResultSet rs = ps.executeQuery();

                    if (!rs.next()) {
                        JOptionPane.showMessageDialog(this, "Product not found");
                        return;
                    }

                    String productName = rs.getString("product_name");
                    int stock = rs.getInt("stock_quantity");
                    double price = rs.getDouble("price");

                    if (quantity > stock) {
                        JOptionPane.showMessageDialog(this, "Insufficient stock!");
                        return;
                    }

                    double total = price * quantity;
                    double gstRate = 0.18;
                    double gstAmount = price * quantity * gstRate;
                    total += gstAmount;

                    // Generate Order ID
                    int orderId = 1;
                    Statement s = con.createStatement();
                    ResultSet rsId = s.executeQuery("SELECT NVL(MAX(order_id),0)+1 FROM orders");
                    if (rsId.next()) orderId = rsId.getInt(1);

                    // Insert Order
                    PreparedStatement orderPs = con.prepareStatement(
                            "INSERT INTO orders VALUES (?, ?, CURRENT_TIMESTAMP, ?, 'Placed')");
                    orderPs.setInt(1, orderId);
                    orderPs.setInt(2, customerId);
                    orderPs.setDouble(3, total);
                    orderPs.executeUpdate();

                    // Insert Order Item
                    PreparedStatement itemPs = con.prepareStatement(
                            "INSERT INTO order_item VALUES (?, ?, ?, ?, ?)");
                    itemPs.setInt(1, orderId);
                    itemPs.setInt(2, orderId);
                    itemPs.setInt(3, productId);
                    itemPs.setInt(4, quantity);
                    itemPs.setDouble(5, price);
                    itemPs.executeUpdate();

                    // SHOW INVOICE
                    showInvoice(orderId, customerId, productName, quantity, price, total, gstAmount);

                    loadInventory();
                    clearFields();

                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(this, "Error: " + ex.getMessage());
                }
            });

            btnClear.addActionListener(e -> clearFields());
        }

        // ================= INVOICE UI =================
        void showInvoice(int orderId, int customerId, String productName,
                         int qty, double price, double total, double gstAmount) {

            JDialog dialog = new JDialog((Frame) null, "Invoice", true);
            dialog.setSize(400, 500);
            dialog.setLayout(new BorderLayout());

            JTextArea area = new JTextArea();
            area.setFont(new Font("Monospaced", Font.PLAIN, 13));
            area.setEditable(false);

            String bill =
                    "=========== INVOICE ===========\n" +
                    "Order ID    : " + orderId + "\n" +
                    "Customer ID : " + customerId + "\n" +
                    "--------------------------------\n" +
                    "Product     : " + productName + "\n" +
                    "Quantity    : " + qty + "\n" +
                    "Unit Price  : " + price + "\n" +
                    "Subtotal    : " + (price * qty) + "\n" +
                    "GST (18%)   : " + gstAmount + "\n" +
                    "--------------------------------\n" +
                    "TOTAL       : " + total + "\n" +
                    "--------------------------------\n" +
                    "Date        : " + new java.util.Date() + "\n" +
                    "================================";

            area.setText(bill);

            dialog.add(new JScrollPane(area), BorderLayout.CENTER);

            JButton printBtn = new JButton("Print");
            JButton pdfBtn = new JButton("Download PDF");

            JPanel panel = new JPanel();
            panel.add(printBtn);
            panel.add(pdfBtn);

            dialog.add(panel, BorderLayout.SOUTH);

            // PRINT
            printBtn.addActionListener(e -> {
                try {
                    area.print();
                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(dialog, "Print Failed");
                }
            });

            // PDF
            pdfBtn.addActionListener(e ->
                    generatePDF(orderId, customerId, productName, qty, price, total, gstAmount));

            dialog.setLocationRelativeTo(this);
            dialog.setVisible(true);
        }

        // ================= PDF GENERATION =================
        void generatePDF(int orderId, int customerId, String productName,
                         int qty, double price, double total, double gstAmount) {

            try {
                String path = "Invoice_" + orderId + ".pdf";

                com.itextpdf.text.Document doc = new com.itextpdf.text.Document();
                com.itextpdf.text.pdf.PdfWriter.getInstance(doc,
                        new java.io.FileOutputStream(path));

                doc.open();

                doc.add(new com.itextpdf.text.Paragraph("INVOICE\n\n"));
                doc.add(new com.itextpdf.text.Paragraph("Order ID: " + orderId));
                doc.add(new com.itextpdf.text.Paragraph("Customer ID: " + customerId));
                doc.add(new com.itextpdf.text.Paragraph("Product: " + productName));
                doc.add(new com.itextpdf.text.Paragraph("Quantity: " + qty));
                doc.add(new com.itextpdf.text.Paragraph("Unit Price: " + price));
                doc.add(new com.itextpdf.text.Paragraph("Subtotal: " + (price * qty)));
                doc.add(new com.itextpdf.text.Paragraph("GST (18%): " + gstAmount));
                doc.add(new com.itextpdf.text.Paragraph("Total: " + total));
                doc.add(new com.itextpdf.text.Paragraph("Date: " + new java.util.Date()));

                doc.close();

                JOptionPane.showMessageDialog(this, "PDF Saved: " + path);

            } catch (Exception e) {
                JOptionPane.showMessageDialog(this, "PDF Error: " + e.getMessage());
            }
        }

        void loadInventory() {
            try {
                productModel.setRowCount(0);
                ResultSet rs = con.createStatement().executeQuery("SELECT * FROM products1");
                while (rs.next()) {
                    productModel.addRow(new Object[]{
                            rs.getInt("product_id"),
                            rs.getString("product_name"),
                            rs.getString("category"),
                            rs.getDouble("price"),
                            rs.getInt("stock_quantity")
                    });
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(this, "Load Error");
            }
        }

        void clearFields() {
            txtCustomerId.setText("");
            txtProductId.setText("");
            txtQuantity.setText("");
        }
    }
    // =========================================================
    //  TAB 4 — ORDER ITEMS DISPLAY
    // =========================================================
    static class OrderItemsPanel extends JPanel {

        JTextField txtCustomerId;
        JTable     table;
        DefaultTableModel model;
        Connection con;

        OrderItemsPanel() {
            setLayout(new BorderLayout(10, 10));

            JPanel topPanel = new JPanel(new FlowLayout(FlowLayout.CENTER, 10, 10));
            topPanel.add(new JLabel("Customer ID:"));
            txtCustomerId = new JTextField(10);
            topPanel.add(txtCustomerId);
            JButton btnSearch = new JButton("View Order Items");
            topPanel.add(btnSearch);
            add(topPanel, BorderLayout.NORTH);

            model = new DefaultTableModel(new String[]{
                    "Order Item ID", "Order ID", "Product ID", "Product Name",
                    "Description", "Quantity", "Unit Price", "Total Cost"}, 0);
            table = new JTable(model);
            add(new JScrollPane(table), BorderLayout.CENTER);

            con = DBConnection.getConnection();
            if (con == null) {
                JOptionPane.showMessageDialog(this, "Database connection failed.");
            } else {
                loadAllOrders();
            }

            btnSearch.addActionListener(e -> {
                try {
                    if (con == null) return;
                    String idText = txtCustomerId.getText().trim();
                    if (idText.isEmpty()) { loadAllOrders(); return; }
                    loadOrderItems(Integer.parseInt(idText));
                } catch (NumberFormatException ex) {
                    JOptionPane.showMessageDialog(this, "Please enter a valid numeric Customer ID.");
                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(this, "Search Error: " + ex.getMessage());
                }
            });

            table.addMouseListener(new java.awt.event.MouseAdapter() {
                public void mouseClicked(java.awt.event.MouseEvent evt) {
                    if (evt.getClickCount() == 2) {
                        int row = table.getSelectedRow();
                        if (row >= 0) {
                            String msg =
                                    "Order Item ID: " + model.getValueAt(row, 0) + "\n" +
                                    "Order ID:      " + model.getValueAt(row, 1) + "\n" +
                                    "Product ID:    " + model.getValueAt(row, 2) + "\n" +
                                    "Quantity:      " + model.getValueAt(row, 5) + "\n" +
                                    "Unit Price:    " + model.getValueAt(row, 6);
                            JOptionPane.showMessageDialog(OrderItemsPanel.this, msg,
                                    "Order Item Details", JOptionPane.INFORMATION_MESSAGE);
                        }
                    }
                }
            });
        }

        void loadAllOrders() {
            try {
                if (con == null) return;
                model.setRowCount(0);
                PreparedStatement ps = con.prepareStatement(
                        "SELECT oi.order_item_id, oi.order_id, oi.product_id, " +
                        "p.product_name, p.description, oi.quantity, oi.price " +
                        "FROM order_item oi " +
                        "JOIN orders o ON oi.order_id = o.order_id " +
                        "JOIN products1 p ON oi.product_id = p.product_id " +
                        "ORDER BY oi.order_id, oi.order_item_id");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int qty     = rs.getInt("quantity");
                    double unit = rs.getDouble("price");
                    model.addRow(new Object[]{
                            rs.getInt("order_item_id"), rs.getInt("order_id"),
                            rs.getInt("product_id"),    rs.getString("product_name"),
                            rs.getString("description"), qty, unit, qty * unit
                    });
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(this, "Load Error: " + e.getMessage());
            }
        }

        void loadOrderItems(int customerId) {
            try {
                if (con == null) return;
                model.setRowCount(0);

                PreparedStatement ps = con.prepareStatement(
                        "SELECT oi.order_item_id, oi.order_id, oi.product_id, " +
                        "p.product_name, p.description, oi.quantity, oi.price " +
                        "FROM order_item oi " +
                        "JOIN orders o ON oi.order_id = o.order_id " +
                        "JOIN products1 p ON oi.product_id = p.product_id " +
                        "WHERE o.customer_id = ? " +
                        "ORDER BY oi.order_id, oi.order_item_id");
                ps.setInt(1, customerId);
                ResultSet rs = ps.executeQuery();

                DefaultTableModel tempModel = new DefaultTableModel(new String[]{
                        "Order Item ID", "Order ID", "Product ID", "Product Name",
                        "Description", "Quantity", "Unit Price", "Total Cost"}, 0);

                boolean found = false;
                while (rs.next()) {
                    found = true;
                    int qty     = rs.getInt("quantity");
                    double unit = rs.getDouble("price");
                    Object[] row = new Object[]{
                            rs.getInt("order_item_id"), rs.getInt("order_id"),
                            rs.getInt("product_id"),    rs.getString("product_name"),
                            rs.getString("description"), qty, unit, qty * unit
                    };
                    model.addRow(row);
                    tempModel.addRow(row);
                }

                if (!found) {
                    JOptionPane.showMessageDialog(this,
                            "No order items found for Customer ID: " + customerId);
                } else {
                    JDialog dlg = new JDialog(
                            SwingUtilities.getWindowAncestor(this),
                            "Order Items for Customer " + customerId,
                            Dialog.ModalityType.APPLICATION_MODAL);
                    JTable t = new JTable(tempModel);
                    t.setAutoCreateRowSorter(true);
                    dlg.getContentPane().add(new JScrollPane(t));
                    dlg.setSize(700, 300);
                    dlg.setLocationRelativeTo(this);
                    dlg.setVisible(true);
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(this, "Load Error: " + e.getMessage());
            }
        }

    } // end OrderItemsPanel

    // =========================================================
    //  TAB 5 — PRODUCT DETAILS (READ-ONLY)
    // =========================================================
    static class ProductDetailsPanel extends JPanel {

        JTable table;
        DefaultTableModel model;
        Connection con;

        ProductDetailsPanel() {
            setLayout(new BorderLayout(10, 10));

            JLabel titleLabel = new JLabel("Product Details", SwingConstants.CENTER);
            titleLabel.setFont(new Font("Arial", Font.BOLD, 18));
            titleLabel.setBorder(BorderFactory.createEmptyBorder(10, 0, 10, 0));
            add(titleLabel, BorderLayout.NORTH);

            model = new DefaultTableModel(new String[]{
                    "Product ID", "Product Name", "Category",
                    "Price", "Stock Quantity", "Description"}, 0);
            table = new JTable(model);
            add(new JScrollPane(table), BorderLayout.CENTER);

            con = DBConnection.getConnection();
            if (con == null) {
                JOptionPane.showMessageDialog(this, "Database connection failed.");
            } else {
                loadProducts();
            }
        }

        void loadProducts() {
            try {
                if (con == null) return;
                model.setRowCount(0);
                PreparedStatement ps = con.prepareStatement(
                        "SELECT product_id, product_name, category, price, stock_quantity, description " +
                        "FROM products1 ORDER BY product_id");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    model.addRow(new Object[]{
                            rs.getInt("product_id"),    rs.getString("product_name"),
                            rs.getString("category"),   rs.getDouble("price"),
                            rs.getInt("stock_quantity"), readClob(rs, "description")
                    });
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(this, "Load Error: " + e.getMessage());
            }
        }

        static String readClob(ResultSet rs, String col) throws Exception {
            Object obj = rs.getObject(col);
            if (obj == null) return "";
            if (obj instanceof Clob) {
                Clob clob = (Clob) obj;
                return clob.getSubString(1, (int) clob.length());
            }
            return obj.toString();
        }

    } // end ProductDetailsPanel

    // =========================================================
    //  TAB 6 — PRODUCT SEARCH (by Name / Category / ID)
    // =========================================================
    static class ProductDisplayPanel extends JPanel {

        JTable table;
        DefaultTableModel model;
        Connection con;

        ProductDisplayPanel() {
            setLayout(new BorderLayout(10, 10));

            JLabel titleLabel = new JLabel("Product Information", SwingConstants.CENTER);
            titleLabel.setFont(new Font("Arial", Font.BOLD, 20));
            add(titleLabel, BorderLayout.NORTH);

            model = new DefaultTableModel(new String[]{
                    "Product ID", "Product Name", "Category",
                    "Price", "Stock Quantity", "Description"}, 0);
            table = new JTable(model);
            add(new JScrollPane(table), BorderLayout.CENTER);

            JButton btnSearchName     = new JButton("Search by Name");
            JButton btnSearchCategory = new JButton("Search by Category");
            JButton btnSearchId       = new JButton("Search by ID");

            JPanel panel = new JPanel();
            panel.add(btnSearchName);
            panel.add(btnSearchCategory);
            panel.add(btnSearchId);
            add(panel, BorderLayout.SOUTH);

            con = DBConnection.getConnection();
            if (con == null) {
                JOptionPane.showMessageDialog(this, "Database connection failed.");
            } else {
                loadProducts();
            }

            btnSearchName.addActionListener(e -> {
                try {
                    String name = JOptionPane.showInputDialog(this, "Enter product name:");
                    if (name == null || name.trim().isEmpty()) return;
                    model.setRowCount(0);
                    PreparedStatement ps = con.prepareStatement(
                            "SELECT * FROM products1 WHERE LOWER(product_name) LIKE ?");
                    ps.setString(1, "%" + name.trim().toLowerCase() + "%");
                    ResultSet rs = ps.executeQuery();
                    boolean found = false;
                    while (rs.next()) { addRow(rs); found = true; }
                    if (!found) { JOptionPane.showMessageDialog(this, "No product found."); loadProducts(); }
                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(this, "Search Error: " + ex.getMessage());
                }
            });

            btnSearchCategory.addActionListener(e -> {
                try {
                    String cat = JOptionPane.showInputDialog(this, "Enter category:");
                    if (cat == null || cat.trim().isEmpty()) return;
                    model.setRowCount(0);
                    PreparedStatement ps = con.prepareStatement(
                            "SELECT * FROM products1 WHERE LOWER(category) LIKE ?");
                    ps.setString(1, "%" + cat.trim().toLowerCase() + "%");
                    ResultSet rs = ps.executeQuery();
                    boolean found = false;
                    while (rs.next()) { addRow(rs); found = true; }
                    if (!found) { JOptionPane.showMessageDialog(this, "No product found."); loadProducts(); }
                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(this, "Search Error: " + ex.getMessage());
                }
            });

            btnSearchId.addActionListener(e -> {
                String idStr = JOptionPane.showInputDialog(this, "Enter Product ID:");
                if (idStr == null || idStr.trim().isEmpty()) return;
                int id;
                try {
                    id = Integer.parseInt(idStr.trim());
                } catch (NumberFormatException nfe) {
                    JOptionPane.showMessageDialog(this, "Invalid Product ID."); return;
                }
                try {
                    model.setRowCount(0);
                    PreparedStatement ps = con.prepareStatement(
                            "SELECT * FROM products1 WHERE product_id = ?");
                    ps.setInt(1, id);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        addRow(rs);
                    } else {
                        JOptionPane.showMessageDialog(this, "Product not found."); loadProducts();
                    }
                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(this, "Search Error: " + ex.getMessage());
                }
            });
        }

        void loadProducts() {
            try {
                if (con == null) return;
                model.setRowCount(0);
                PreparedStatement ps = con.prepareStatement(
                        "SELECT * FROM products1 ORDER BY product_id");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) addRow(rs);
            } catch (Exception e) {
                JOptionPane.showMessageDialog(this, "Load Error: " + e.getMessage());
            }
        }

        void addRow(ResultSet rs) throws Exception {
            Object obj  = rs.getObject("description");
            String desc = "";
            if (obj != null) {
                if (obj instanceof Clob) {
                    Clob clob = (Clob) obj;
                    desc = clob.getSubString(1, (int) clob.length());
                } else {
                    desc = obj.toString();
                }
            }
            model.addRow(new Object[]{
                    rs.getInt("product_id"),    rs.getString("product_name"),
                    rs.getString("category"),   rs.getDouble("price"),
                    rs.getInt("stock_quantity"), desc
            });
        }

    } // end ProductDisplayPanel

} // end ShopManagementSystem
