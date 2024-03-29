package com.neusoft.system.tools;

import java.security.MessageDigest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import com.neusoft.system.db.DBUtils;

public class Tools 
{

	public static void main(String[] args) 
	{
		try 
		{
			/**
			 * MD5二次混淆加密
			 */
			//得到明文
			String pwd="0000";
			//完成原始加密
			String md5pwd1=Tools.MD5Encode(pwd);
			//生成混淆明文
			String pwd2=md5pwd1+"隐技フャゥソツ巧ΧΤΚㄕㄣˇΒ于无形:以無にはたコをっㄘㄗㄡεωぅ法為有法,以無ㄤㄆмязр限為有限"+md5pwd1;
			String md45pwd2=Tools.MD5Encode(pwd2);
			System.out.println(md45pwd2);
			
			
			
			/**
			 * MD5的几个特征
			 * 1.同一明文,加密后的密文永远相同
			 * 2.无论明文多长,密文的长度都是32位
			 * 3.MD5不可逆:不可以从密文再还原成明文
			 */
//			//定义明文口令
//			String pwd="1";
//			//获取密文
//			String pwd_md5=Tools.MD5Encode(pwd);
//			System.out.println("pwd_md5="+pwd_md5);
//			System.out.println("pwd_md5.length="+pwd_md5.length());
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	private Tools() {}

	
	/***************************************************************************
	 *                    MD5Begin
	 ***************************************************************************/
	
	
	   public static String getMd5(Object pwd)throws Exception
	   {
			/**
			 * MD5二次混淆加密
			 */
			//完成原始加密
			String md5pwd1=Tools.MD5Encode(pwd);
			//生成混淆明文
			String pwd2=md5pwd1+"隐技フャゥソツ巧ΧΤΚㄕㄣˇΒ于无形:以無にはたコをっㄘㄗㄡεωぅ法為有法,以無ㄤㄆмязр限為有限"+md5pwd1;
			String md5pwd2=Tools.MD5Encode(pwd2);
			return md5pwd2;

	   }
	
	   
	    private final static String[] hexDigits = {
		     "0", "1", "2", "3", "4", "5", "6", "7",
		     "8", "9", "a", "b", "c", "d", "e", "f"
		     };

		  /**
		   * 转换字节数组为16进制字串
		   * @param b 字节数组
		   * @return 16进制字串
		   */
		  private static String byteArrayToHexString(byte[] b)
		  {
		      StringBuffer resultSb = new StringBuffer();
		      for (int i = 0; i < b.length; i++)
		      {
		         resultSb.append(byteToHexString(b[i]));
		      }
		      return resultSb.toString();
		  }
		  /**
		   * 转换字节为16进制字符串
		   * @param b byte
		   * @return String
		   */
		  private static String byteToHexString(byte b)
		  {
		      int n = b;
		      if (n < 0)
		         n = 256 + n;
		      int d1 = n / 16;
		      int d2 = n % 16;
		      return hexDigits[d1] + hexDigits[d2];
		  }
		  /**
		   * 得到MD5的秘文密码
		   * @param origin String
		   * @throws Exception
		   * @return String
		   */
		  private static String MD5Encode(Object origin) throws Exception
		  {
		       String resultString = null;
		       try
		       {
		           resultString=new String(origin.toString());
		           MessageDigest md = MessageDigest.getInstance("MD5");
		           resultString=byteArrayToHexString(md.digest(resultString.getBytes()));
		           return resultString;
		       }
		       catch (Exception ex)
		       {
		          throw ex;
		       }
		  }	
	/***************************************************************************
	 *                    MD5End
	 ***************************************************************************/

	
	/**
	 * 获取员工流水号
	 * @return  String number="yyyy"+4位流水码
	 * @throws Exception
	 */
	public static String getEmpNumber()throws Exception
	{
		return Tools.getCurrentYear()+Tools.getFormatNumber("E");
	}
	
	private static final String baseCode1="0000";
	
	/**
	 * 获取格式化的尾码
	 * @param firstName
	 * @return
	 * @throws Exception
	 */
	private static String getFormatNumber(String firstName)throws Exception
	{
		//1.获取流水号
		int lastNumber=Tools.getNumnberForYear(firstName);
		//2.计算流水号的宽度
		int size=String.valueOf(lastNumber).length();
		
		return baseCode1.substring(size)+lastNumber;
		
	}
	
	/**
	 * 获取员工编号的尾码
	 * @param firstName
	 * @return
	 * @throws Exception
	 */
	private static int getNumnberForYear(String firstName)throws Exception
	{
		PreparedStatement pstm1=null;
		PreparedStatement pstm2=null;
		ResultSet rs=null;
		try
		{
			//1.定义SQL语句查询当前值
			StringBuilder sql1=new StringBuilder()
					.append("select a.pkvalue ")
					.append("  from sequence a ")
					.append("  where date_format(a.sdate,'%Y')=date_format(current_date,'%Y')")
					.append("    and a.pkname=?")
					;
			pstm1=DBUtils.prepareStatement(sql1.toString());
			pstm1.setObject(1, firstName);
			rs=pstm1.executeQuery();
			
			int currentVal=0;
			StringBuilder sql2=new StringBuilder();
			if(rs.next())
			{
				currentVal=rs.getInt(1);
				sql2.append("update sequence ")
				    .append("   set pkvalue=?")
				    .append(" where date_format(sdate,'%Y')=date_format(current_date,'%Y')")
				    .append("   and pkname=?")
				;
			}
			else
			{
				sql2.append("insert into sequence(pkvalue,pkname,sdate)")
				    .append("              values(?,?,current_date)")
				;
			}
			pstm2=DBUtils.prepareStatement(sql2.toString());
			pstm2.setObject(1, ++currentVal);
			pstm2.setObject(2, firstName);
			pstm2.executeUpdate();
			
			return currentVal;
		}
		finally
		{
			DBUtils.close(rs);
			DBUtils.close(pstm1);
			DBUtils.close(pstm2);
		}
		
		
	}
	
	/**
	 * 获取年码
	 * @return
	 */
	private static String  getCurrentYear()
	{
//		//实例化日期格式类
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy");
//		//获取系统当前日期
//		Date d=new Date();
//		//格式化当前日期
//		String str_date=sdf.format(d);
//		return str_date;
		
		
		return new SimpleDateFormat("yyyy").format(new java.util.Date());
	}
	
			
	/**
	 * 将数组连接成字符串
	 * @param element
	 * @return
	 */
	public static String joinArray(Object element)
	{
		//空值拦截
		if(element==null || element.equals(""))
		{
			return "";
		}
		
		//判断element到底是什么?是字符串还是字符串数组
		if(element instanceof java.lang.String[])
		{
			//将参数转换成字符串数组
			String arr[]=(String[])element;
			//计算数组长度
			int len=arr.length;
			//构造动态字符串对象,装载数组的每个元素
			StringBuilder tem=new StringBuilder(arr[0]);
			//循环读取数组的后继元素
			for(int i=1;i<len;i++)
			{
				tem.append(",").append(arr[i]);
			}
			return tem.toString();
		}
		else
		{
			return element.toString();
		}	
		
	}
	
	
	 /**
	  * 获取主键值 
	  * @param pkname
	  * @return
	  * @throws Exception
	  */
    public static int getSequence(String pkname)throws Exception
    {
   	 PreparedStatement pstm1=null;    //查询序列的当前值
   	 PreparedStatement pstm2=null;    //修改序列的当前值
   	 ResultSet rs=null;
   	 try
   	 {
   		 //定义SQL语句,查询序列的当前值
   		 String sql1="select a.pkvalue from sequence a where a.pkname=?";
   		 //编译SQL1
   		 pstm1=DBUtils.prepareStatement(sql1);
   		 //参数赋值
   		 pstm1.setObject(1, pkname);
   		 //执行查询
   		 rs=pstm1.executeQuery();
   		 
   		 //定义序列当前值
   		 int currentVal=0;
   		 //判断数据库中,是否存在当前列的值
   		 if(rs.next())
   		 {
   			 //读取数据库当前值,为序列赋值
   			 currentVal=rs.getInt(1);
   			 
   			 //修改数据中的值,在原来基础上+1
   			 String sql2="update sequence set pkvalue=? where pkname=?";
   			 pstm2=DBUtils.prepareStatement(sql2);
   			 pstm2.setObject(1, ++currentVal);
   			 pstm2.setObject(2, pkname);
   			 pstm2.executeUpdate();
   			 System.out.println(sql2.toString());
   			 
   		 }
   		 else
   		 {
   			 //向数据库录入当前主键的数据,pkvalue值为1
   			 String sql2="insert into sequence(pkname,pkvalue) values(?,?)";
   			 pstm2=DBUtils.prepareStatement(sql2);
   			 pstm2.setObject(1, pkname);
   			 pstm2.setObject(2, ++currentVal);
   			 pstm2.executeUpdate();
   		 }	 
   		 
   		 return currentVal;
   		 
   	 }
   	 finally
   	 {
   		 DBUtils.close(rs);
   		 DBUtils.close(pstm1);
   		 DBUtils.close(pstm2);
   	 }
    }

}
