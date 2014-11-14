/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.rplt.studioMusik.testPackage;

import com.rplt.studioMusik.model.DatabaseConnection;
import com.rplt.studioMusik.model.StudioMusik;
import java.util.List;

/**
 *
 * @author root
 */
public class TestClass {
    
    public static void main(String[] args) {
        DatabaseConnection databaseConnection = new DatabaseConnection();
        
        List<StudioMusik> dataList = StudioMusik.getDataList();
        
        for (int i = 0; i < dataList.size(); i++) {
            System.out.println(dataList.get(i).getmNamaStudio());
        }
    }
    
}
