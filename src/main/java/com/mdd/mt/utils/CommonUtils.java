package com.mdd.mt.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Administrator on 2016/12/25.
 */
public class CommonUtils {
    public  static String simpleMatch(String text,String regex){
        Pattern compile = Pattern.compile(regex);
        Matcher matcher = compile.matcher(text);
        if (matcher.find()) {
            return matcher.group(1);
        }
        return null;
    }

    public static List<String> multipMatch(String text, String regex){
        List<String>groups = new ArrayList<String>();
        Pattern compile = Pattern.compile(regex);
        Matcher matcher = compile.matcher(text);
        if (matcher.find()){
            for(int i=1;i<=matcher.groupCount();i++){
                groups.add(matcher.group(i));
            }
        }
        return groups;
    }

    public static void main(String[] args) {
        String text = "纵横国际影城（石厦店） 地址：福田区石厦北二街89号石厦新港商城3楼318 [地图] 电话：0755-28181068 查看影院详情";
        String regx = "地址：(.*)\\[地图\\].*电话：(\\d+-\\d+)";
        CommonUtils.multipMatch(text,regx);
    }


    /**
     * 动态的生成每天今天明天的电影场次的url
     *
     * @param dateChoose 0代表今天，1代表明天
     * @return
     */
    public static String getDetailScheduleDate(int dateChoose) {
        //获取当前日期
        Date date = new Date();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        String resultDate = sf.format(date);
        if (0 == dateChoose) {
            return resultDate;
        } else if (1 == dateChoose) {
            //通过日历获取下一天日期
            Calendar cal = Calendar.getInstance();
            try {
                cal.setTime(sf.parse(resultDate));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            cal.add(Calendar.DAY_OF_YEAR, +1);
            resultDate = sf.format(cal.getTime());
        }
        return resultDate;
    }

    public static Date String4Date(String dateStr) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd:hh:ss");
        Date date = null;
        try {
            date = sdf.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String s = "\n" +
                "\t\t\t\t\n" +
                "\t\t\t\t\n" +
                "\t\t\t\t\t\n" +
                "\t\t\t\t\t\n" +
                "\t\t\t\t\t\n" +
                "\t\t\t\t\t<tr class=\"\">\n" +
                "\t\t\t\t\t\t\n" +
                "\t\t\t\t<td style=\"white-space: nowrap;\">\n" +
                "\t\t\t\t\t6222 6206 2000 5617 047\t\t\t\t\n" +
                "\t\t\t\t</td>\n" +
                "\t\t\t\t\n" +
                "\t\t\t\t\t\n" +
                "\t\t\t\t\t\t<td>王勇义</td>\n" +
                "\t\t\t\t\t\t<td>\n" +
                "\t\t\t\t\t\t\t\n" +
                "\t\t\t\t\t\t\t\t\n" +
                "\t\t\t\t\t\t\t\t--\n" +
                "\t\t\t\t\t\t\t\n" +
                "\t\t\t\t\t\t</td>\n" +
                "\t\t\t\t\t\t<td>借记卡</td>\n" +
                "\t\t\t\t\t\t<td>人民币</td>\n" +
                "\t\t\t\t\t\t<td style=\"white-space: nowrap;\">0.00</td>\n" +
                "\t\t\t\t\t\t<td style=\"white-space: nowrap;\">0.00</td>\n" +
                "\t\t\t\t\t\t<td>\n" +
                "\t\t\t\t\t\t\t<a style=\"font-size:13px;\" href=\"#\" onclick=\"showDetail('8c3cba8d601d28187815d1358a009ddf')\">明细</a>\t\n" +
                "\t\t\t\t\t\t|\n" +
                "\t\t\t\t\t\t\t<a style=\"font-size:13px;\" href=\"#\" onclick=\"newwindow('8c3cba8d601d28187815d1358a009ddf','cny');\">本&#047;外币</a>\n" +
                "\t\t\t\t\t\t|\n" +
                "\t\t\t\t\t\t\t<a style=\"font-size:13px;\" href=\"#\" onclick=\"Util.changeMenu('P010001',{cardNo:'8c3cba8d601d28187815d1358a009ddf'});\">我要转账</a>\n" +
                "\t\t\t\t\t\t|\n" +
                "\t\t\t\t\t\t\t<a style=\"font-size:13px;\" href=\"#\" onclick=\"Util.changeMenu('P026002',{cardNo:'8c3cba8d601d28187815d1358a009ddf'});\">我要理财</a>\n" +
                "\t\t\t\t\t\t</td>  \n" +
                "\t\t\t\t\t\n" +
                "\t\t\t\t\t\n" +
                "\t\t\t\t\n" +
                "\t\t\t\n" +
                "\t\t\t\t\t</tr>\n" +
                "\t\t\t\t\t\n" +
                "\t\t\t\t\n" +
                "\t";
        return date;
    }
}
