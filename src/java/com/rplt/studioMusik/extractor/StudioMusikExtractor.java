/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.rplt.studioMusik.extractor;

import com.rplt.studioMusik.model.StudioMusik;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

/**
 *
 * @author root
 */
public class StudioMusikExtractor implements ResultSetExtractor<StudioMusik> {

    @Override
    public StudioMusik extractData(ResultSet rs) throws SQLException, DataAccessException {
        StudioMusik studioMusik = new StudioMusik();
        
        studioMusik.setmKodeStudio(rs.getString(1));
        studioMusik.setmNamaStudio(rs.getString(2));
        studioMusik.setmTarifPerJam(rs.getInt(3));
        
        return studioMusik;
    }
    
}
