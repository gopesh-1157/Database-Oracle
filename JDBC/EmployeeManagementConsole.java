package dbms;

import java.sql.*;
import java.util.Scanner;

public class EmployeeManagementConsole {

    // --- DB CONFIG ---
    private static final String DB_URL = "jdbc:oracle:thin:@Gopesh:1521:XE";
    private static final String DB_USER = "system";
    private static final String DB_PASS = "Rsg_1157";

    public static Connection getConnection() throws Exception {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
    }

    public void startConsoleMenu() {
        Scanner sc = new Scanner(System.in);

        while (true) {
            System.out.println("\n--- Employee Management Console ---");
            System.out.println("1. Insert  2. Update  3. Delete  4. View All  5. Exit");
            System.out.print("Select choice: ");

            String mainChoice = sc.nextLine();

            try {
                switch (mainChoice) {

                    // ================= INSERT =================
                    case "1":
                        System.out.print("ID: "); String id = sc.nextLine();
                        System.out.print("Name: "); String name = sc.nextLine();
                        System.out.print("Salary: "); String sal = sc.nextLine();
                        System.out.print("Role: "); String role = sc.nextLine();
                        System.out.print("Email: "); String mail = sc.nextLine();

                        if (id.isEmpty() || sal.isEmpty() || role.isEmpty() || mail.isEmpty()) {
                            System.out.println("⚠ Required fields missing!");
                            break;
                        }

                        String insSql = "INSERT INTO EMPLOYEE (EMPLOYEE_ID, NAME, SALARY, ROLE, MAIL) VALUES (?, ?, ?, ?, ?)";

                        try (Connection con = getConnection();
                             PreparedStatement ps = con.prepareStatement(insSql)) {

                            ps.setInt(1, Integer.parseInt(id));
                            ps.setString(2, name);
                            ps.setDouble(3, Double.parseDouble(sal));
                            ps.setString(4, role);
                            ps.setString(5, mail);

                            ps.executeUpdate();
                            System.out.println("✔ Inserted successfully.");
                        }
                        break;

                    case "2": // --- UPDATE WITH FULL ERROR HANDLING ---
                        System.out.print("Enter ID to Update: ");
                        String upId = sc.nextLine().trim();

                        if (upId.isEmpty()) {
                            System.out.println("⚠ ID is required!");
                            break;
                        }

                        int empId;
                        try {
                            empId = Integer.parseInt(upId);
                        } catch (NumberFormatException e) {
                            System.out.println("⚠ ID must be a valid number!");
                            break;
                        }

                        System.out.println("\n1.Name  2.Salary  3.Role  4.Mail  5.Name+Salary  6.All");
                        System.out.print("Choice: ");
                        String updateChoice = sc.nextLine();

                        try (Connection con = getConnection()) {

                            switch (updateChoice) {

                                case "1": // NAME
                                    System.out.print("New Name: ");
                                    String newname = sc.nextLine().trim();

                                    if (newname.isEmpty()) {
                                        System.out.println("⚠ Name cannot be empty!");
                                        break;
                                    }

                                    try (PreparedStatement ps = con.prepareStatement(
                                            "UPDATE EMPLOYEE SET NAME=? WHERE EMPLOYEE_ID=?")) {

                                        ps.setString(1, newname);
                                        ps.setInt(2, empId);

                                        System.out.println(ps.executeUpdate() > 0 ? "✔ Name Updated" : "⚠ ID not found");
                                    }
                                    break;

                                case "2": // SALARY
                                    System.out.print("New Salary: ");
                                    String newSal = sc.nextLine().trim();

                                    double salary;
                                    try {
                                        salary = Double.parseDouble(newSal); // ✅ FIXED
                                        if (salary < 0) {
                                            System.out.println("⚠ Salary cannot be negative!");
                                            break;
                                        }
                                    } catch (NumberFormatException e) {
                                        System.out.println("⚠ Invalid salary format!");
                                        break;
                                    }

                                    try (PreparedStatement ps = con.prepareStatement(
                                            "UPDATE EMPLOYEE SET SALARY=? WHERE EMPLOYEE_ID=?")) {

                                        ps.setDouble(1, salary);
                                        ps.setInt(2, empId);

                                        System.out.println(ps.executeUpdate() > 0 ? "✔ Salary Updated" : "⚠ ID not found");
                                    }
                                    break;

                                case "3": // ROLE
                                    System.out.print("New Role: ");
                                    String newrole = sc.nextLine().trim();

                                    if (newrole.isEmpty()) { // ✅ FIXED
                                        System.out.println("⚠ Role cannot be empty!");
                                        break;
                                    }

                                    try (PreparedStatement ps = con.prepareStatement(
                                            "UPDATE EMPLOYEE SET ROLE=? WHERE EMPLOYEE_ID=?")) {

                                        ps.setString(1, newrole); // ✅ FIXED
                                        ps.setInt(2, empId);

                                        System.out.println(ps.executeUpdate() > 0 ? "✔ Role Updated" : "⚠ ID not found");
                                    }
                                    break;

                                case "4": // MAIL
                                    System.out.print("New Email: ");
                                    String newmail = sc.nextLine().trim();

                                    if (newmail.isEmpty()) { // ✅ FIXED
                                        System.out.println("⚠ Email cannot be empty!");
                                        break;
                                    }

                                    if (!newmail.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) { // ✅ FIXED
                                        System.out.println("⚠ Invalid email format!");
                                        break;
                                    }

                                    try (PreparedStatement ps = con.prepareStatement(
                                            "UPDATE EMPLOYEE SET MAIL=? WHERE EMPLOYEE_ID=?")) {

                                        ps.setString(1, newmail); // ✅ FIXED
                                        ps.setInt(2, empId);

                                        System.out.println(ps.executeUpdate() > 0 ? "✔ Email Updated" : "⚠ ID not found");
                                    }
                                    break;

                                // (case 5 and 6 already correct 👍)

                                default:
                                    System.out.println("⚠ Invalid choice!");
                            }

                        } catch (SQLException e) {
                            System.out.println("⚠ Database error: " + e.getMessage());
                        } catch (Exception e) {
                            System.out.println("⚠ Unexpected error: " + e.getMessage());
                        }

                        break;                    // ================= DELETE =================
                    case "3":
                        System.out.print("Enter ID: ");
                        String delId = sc.nextLine();

                        if (delId.isEmpty()) {
                            System.out.println("⚠ ID required!");
                            break;
                        }

                        try (Connection con = getConnection();
                             PreparedStatement ps = con.prepareStatement(
                                     "DELETE FROM EMPLOYEE WHERE EMPLOYEE_ID=?")) {

                            ps.setInt(1, Integer.parseInt(delId));
                            System.out.println(ps.executeUpdate() > 0 ? "✔ Deleted" : "⚠ Not found");
                        }
                        break;

                    // ================= VIEW =================
                    case "4":
                        try (Connection con = getConnection();
                             Statement st = con.createStatement();
                             ResultSet rs = st.executeQuery("SELECT * FROM EMPLOYEE")) {

                            System.out.println("\nID | Name | Role | Salary | Email");

                            while (rs.next()) {
                                System.out.printf("%d | %s | %s | %.2f | %s\n",
                                        rs.getInt("EMPLOYEE_ID"),
                                        rs.getString("NAME"),
                                        rs.getString("ROLE"),
                                        rs.getDouble("SALARY"),
                                        rs.getString("MAIL"));
                            }
                        }
                        break;

                    case "5":
                        System.out.println("Exiting...");
                        System.exit(0);

                    default:
                        System.out.println("Invalid choice.");
                }

            } catch (NumberFormatException e) {
                System.out.println("⚠ Invalid number format!");
            } catch (Exception e) {
                System.out.println("✖ Error: " + e.getMessage());
            }
        }
    }

    public static void main(String[] args) {
        new EmployeeManagementConsole().startConsoleMenu();
    }
}
