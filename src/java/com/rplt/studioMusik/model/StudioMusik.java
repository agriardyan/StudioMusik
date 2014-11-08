/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.rplt.studioMusik.model;

import com.rplt.studioMusik.mapper.StudioMusikRowMapper;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author root
 */
public class StudioMusik {
    
    private String mKodeStudio;  
    private String mNamaStudio;  
    private int mTarifPerJam;  

    public StudioMusik() {
    }

    public String getmKodeStudio() {
        return mKodeStudio;
    }

    public void setmKodeStudio(String mKodeStudio) {
        this.mKodeStudio = mKodeStudio;
    }

    public String getmNamaStudio() {
        return mNamaStudio;
    }

    public void setmNamaStudio(String mNamaStudio) {
        this.mNamaStudio = mNamaStudio;
    }

    public int getmTarifPerJam() {
        return mTarifPerJam;
    }

    public void setmTarifPerJam(int mTarifPerJam) {
        this.mTarifPerJam = mTarifPerJam;
    }
    
    public static void simpanData(StudioMusik pStudioMusik) {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        String sql = "INSERT INTO studio_musik VALUES(?, ?, ?)";

        jdbcTemplate.update(sql,
                new Object[]{
                    pStudioMusik.getmKodeStudio(),
                    pStudioMusik.getmNamaStudio(),
                    pStudioMusik.getmTarifPerJam()
                });
    }
    
    public static List<StudioMusik> getDataList() {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        List pegawaiList = new ArrayList();

        String sql = "SELECT * FROM studio_musik";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        pegawaiList = jdbcTemplate.query(sql, new StudioMusikRowMapper());
        return pegawaiList;
    }
    
    public static void updateData(StudioMusik pStudioMusik) {
        DataSource dataSource = DatabaseConnection.getmDataSource();

        String sql = "UPDATE studio_musik SET "
                + "nama_studio = ?, "
                + "tarif_per_jam = ? "
                + "WHERE kode_studio = ?";
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        jdbcTemplate.update(sql,
                new Object[]{
                    pStudioMusik.getmNamaStudio(),
                    pStudioMusik.getmTarifPerJam(),
                    pStudioMusik.getmKodeStudio()
                });
    }
    
    public static void deleteData(String pKodeStudio) {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        
        String sql = "DELETE FROM studio_musik WHERE studio_musik = " + pKodeStudio;
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.update(sql);
    }
    
    
}