
import java.sql.*;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTable;


public class Connecting2DB {

    public Connection setconnection() {

        Connection conn = null;
    
        try {
            
            String driverName = "oracle.jdbc.driver.OracleDriver";
            Class.forName(driverName);
            
            String serverName = "localhost";
            String serverPort = "1521";
            
            String sid = "orcl.168.1.103";
            String url = "jdbc:oracle:thin:@" + serverName + ":" + serverPort + "/" + sid;
            
            String username = "hr";
            String password = "hr";
            
            conn = DriverManager.getConnection(url, username, password);
            
            System.out.println("Successfully connected to database");

        } catch (ClassNotFoundException e) {
            System.out.println("Could no find database driver" + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Could not connect to database" + e.getMessage());
        }

        return conn;
    }
    
    public void retriveToTable(JTable table, String query) {
        try {

            Connection con = setconnection();

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(query);

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        }
    }
    
    public String retriveOne(String query, String name) {
        String value = null;

        try {

            Connection con = setconnection();

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(query);
            
            while (rs.next()) {
                value = rs.getString(name);
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        }
        return value;
    }
    
    public void retriveToBox(JComboBox box, String query, String name) {
        try {

            Connection con = setconnection();

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(query);
                        
            while (rs.next()) {
                box.addItem(rs.getString(name));
            }
            
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        }
    }

    public void executeDeleteUpdate(String query) {
        String value = null;
        try {
            Connection con = setconnection();
            Statement st = con.createStatement();
            st.executeUpdate(query);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        }
    }

    public void insert_into_table(String query) {
        try {
            Connection con = setconnection();
            Statement st = con.createStatement();
            st.execute(query);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        }
    }

}
