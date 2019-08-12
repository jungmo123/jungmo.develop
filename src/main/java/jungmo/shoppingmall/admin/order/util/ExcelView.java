package jungmo.shoppingmall.admin.order.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import jungmo.shoppingmall.admin.order.domain.Order;

public class ExcelView extends AbstractExcelPOIView {
	 
    @SuppressWarnings("unchecked")
    @Override
    protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
 
        String target = model.get("target").toString();
        DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
        //target에 따라서 엑셀 문서 작성을 분기한다.
        if(target.equals("orders")){
            //Object로 넘어온 값을 각 Model에 맞게 형변환 해준다.
            List<Order> orders = (List<Order>) model.get("excelList");
 
            //Sheet 생성
            Sheet sheet = workbook.createSheet(target);
            sheet.setColumnWidth(0, 30*256);
            Row row = null;
            int rowCount = 0;
            int cellCount = 0;
 
            // 제목 Cell 생성
            row = sheet.createRow(rowCount++);
 
            row.createCell(cellCount++).setCellValue("ordNum");
            row.createCell(cellCount++).setCellValue("ordType");
            row.createCell(cellCount++).setCellValue("ordDate");
 
            // 데이터 Cell 생성
            for (Order order : orders) {
                row = sheet.createRow(rowCount++);
                cellCount = 0;
                row.createCell(cellCount++).setCellValue(order.getOrdNum()); //데이터를 가져와 입력
                row.createCell(cellCount++).setCellValue(order.getOrdType());
                row.createCell(cellCount++).setCellValue(sdFormat.format(order.getOrdDate()));
            }
        }
    }
 
    @Override
    protected Workbook createWorkbook() {
        return new XSSFWorkbook();
    }
 
}