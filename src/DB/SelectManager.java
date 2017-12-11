package DB;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Candy;

public class SelectManager {
	  //查询方法
    public ArrayList<Candy> select(String id,String name) throws ClassNotFoundException, SQLException{
    	ConnectionManager connection = new ConnectionManager();
    	Connection conn=null;
    	Statement stat=null;
	    ResultSet rs=null;
	    conn=connection.getConnect();
		stat=conn.createStatement();
    	ArrayList<Candy> result=new ArrayList<Candy>();
    	if(id!="" && id !=null && name==""){
   	        rs = stat.executeQuery("select * from Candy where id="+Integer.parseInt(id)+""); 
     	}
    	if(id==null&&name!=null){
   	        rs = stat.executeQuery("select * from Candy where candyName='"+name+"'"); 
   	    }
    	if(id==""&&name==""){
   	     rs=stat.executeQuery("select * from Candy"); 
   	    }
    	while(rs.next())
        {
    		Candy st = new Candy();
        	st.setId(rs.getInt("id"));
        	st.setCandyName(rs.getString("candyName"));
        	st.setCandyTaste(rs.getString("candyTaste"));
        	st.setPricae(rs.getInt("price"));
        	result.add(st);	
        }
	    if(rs!=null){
	    	  rs.close();
	       }
	    connection.close(stat,conn);
    	return result;
    }

}
