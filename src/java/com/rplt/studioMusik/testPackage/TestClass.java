/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.rplt.studioMusik.testPackage;

import com.rplt.studioMusik.model.DataPegawai;
import com.rplt.studioMusik.model.DataPersewaanStudioMusik;
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
        
        //cek ketersediaan
        
        DataPersewaanStudioMusik dpsm = new DataPersewaanStudioMusik();
        String generatedKodeSewa = dpsm.getGeneratedKodeSewa();
        System.out.println(generatedKodeSewa);
        
//        simpanData();
        
        getDataList();
        
        testLogin();
        
//        dpsm.setmKodeStudio("101");
//        dpsm.setmTanggalSewa("11-NOV-14");
//        dpsm.setmJamSewa("10:00:00");
////        dpsm.setmDurasi("13:00:00");
//        
//        boolean testCekKetersediaanJadwal = TestClass.testCekKetersediaanJadwal(dpsm);
//        System.out.println(testCekKetersediaanJadwal);
    }
    
    public static boolean testCekKetersediaanJadwal(DataPersewaanStudioMusik pDataPersewaanStudioMusik)
    {
        return DataPersewaanStudioMusik.cekKetersediaanJadwal(pDataPersewaanStudioMusik);
    }
    
    public static void simpanData()
    {
        DataPersewaanStudioMusik dpsm = new DataPersewaanStudioMusik();
        dpsm.setmKodeStudio("103");
        dpsm.setmNamaPenyewa("John");
        dpsm.setmNomorTeleponPenyewa("0856478945");
        dpsm.setmTanggalSewa("18-NOV-14");
        dpsm.setmJamSewa("18:00");
        dpsm.setmDurasi(60);
        dpsm.setmBiayaPelunasan(30000);
        dpsm.setmStatusPelunasan("BOOKING");
        
        DataPersewaanStudioMusik.simpanData(dpsm);
        
    }
    
    public static void getDataList()
    {
        List<DataPersewaanStudioMusik> dataList = DataPersewaanStudioMusik.getDataList();
        for (int i = 0; i < dataList.size(); i++) {
            System.out.println(dataList.get(i).getmKodeSewa() + "\t" + dataList.get(i).getmNamaPenyewa());
        }
    }
    
    public static void testLogin()
    {
        int login = DataPegawai.validateLoginCredential("P003", "P003", "operator");
        System.out.println(login);
    }
    
}
