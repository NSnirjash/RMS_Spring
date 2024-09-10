package com.Project.RMSSpring.restcontroller;


import com.Project.RMSSpring.entity.Tables;
import com.Project.RMSSpring.service.TableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("table/api")
public class TableRestController {

    @Autowired
    private TableService tableService;

    public ResponseEntity<List<Tables>> getAllTables() {
        List<Tables> tables = tableService.getAllTables();
        return new ResponseEntity<>(tables, HttpStatus.OK);
    }

    public ResponseEntity<Tables> saveTable(Tables tables) {
        tableService.saveTable(tables);
        return new ResponseEntity<>(tables, HttpStatus.OK);
    }

    public ResponseEntity<String> deleteTable(@PathVariable ("id") int id) {
        tableService.deleteTable(id);
        return new ResponseEntity<>("Table deleted Succesfully",HttpStatus.OK);
    }

    public ResponseEntity<String> updateTable(@PathVariable ("id") int id, @RequestBody Tables tables) {
        tableService.updateTable(tables,id);
        return new ResponseEntity<>("Table updated Successfully", HttpStatus.OK);
    }
}
