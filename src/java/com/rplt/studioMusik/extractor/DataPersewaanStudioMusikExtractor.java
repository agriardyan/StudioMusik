/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.rplt.studioMusik.extractor;

import com.rplt.studioMusik.model.DataPersewaanStudioMusik;
import com.rplt.studioMusik.model.StudioMusik;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

/**
 *
 * @author root
 */
public class DataPersewaanStudioMusikExtractor implements ResultSetExtractor<DataPersewaanStudioMusik> {

    @Override
    public DataPersewaanStudioMusik extractData(ResultSet rs) throws SQLException, DataAccessException {
        DataPersewaanStudioMusik dataPersewaanStudioMusik = new DataPersewaanStudioMusik();
        
        dataPersewaanStudioMusik.setmKodeSewa(rs.getString(1));
        dataPersewaanStudioMusik.setmKodeStudio(rs.getString(2));
        dataPersewaanStudioMusik.setmNamaPenyewa(rs.getString(3));
        dataPersewaanStudioMusik.setmNomorTeleponPenyewa(rs.getString(4));
        dataPersewaanStudioMusik.setmTanggalSewa(rs.getString(5));
        dataPersewaanStudioMusik.setmJamSewa(rs.getString(6));
        dataPersewaanStudioMusik.setmDurasi(rs.getInt(7));
        dataPersewaanStudioMusik.setmBiayaPelunasan(rs.getInt(8));
        dataPersewaanStudioMusik.setmStatusPelunasan(DataPersewaanStudioMusik.STATUS_PELUNASAN.UANG_MUKA);
        
        return dataPersewaanStudioMusik;
    }

    
}
