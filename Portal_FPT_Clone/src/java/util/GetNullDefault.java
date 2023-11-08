/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

/**
 *
 * @author MINH TUAN
 */
public class GetNullDefault {

    public int getDefaultIfNull(Object value, int defaultValue) {
        if (value != null) {
            return (int) value;
        } else {
            return defaultValue;
        }
    }
}
