package basic;

import java.util.Date;
import java.text.SimpleDateFormat;

public class DateTest 
{

	public static void main(String[] args) 
	{
		//ʵ�������ڸ�ʽ��
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//��ȡϵͳ��ǰ����
		Date d=new Date();
		//��ʽ����ǰ����
		String str_date=sdf.format(d);
		System.out.println(str_date);
		
	}

}
