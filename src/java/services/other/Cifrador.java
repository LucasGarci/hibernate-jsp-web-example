/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.other;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Alumno
 */
public class Cifrador {

    public static String getSHA_256_Digest(String pass) {
        MessageDigest md;
        String cifrado = null;
        try {
            md = MessageDigest.getInstance("SHA-256");
            //TEXTO A BYTES
            byte dataBytes[] = pass.getBytes();
            //SE INTRODUCE TEXTO EN BYTES A RESUMIR
            md.update(dataBytes);
            //SE CALCULA EL RESUMEN
            byte resumen[] = md.digest();
            //SE PASA A HEXADECIMAL
            cifrado = toHexadecimal(resumen);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return cifrado;
    }// main

    // CONVIERTE UN ARRAY DE BYTES A HEXADECIMAL
    private static String toHexadecimal(byte[] resumen) {
        String hex = "";
        for (int i = 0; i < resumen.length; i++) {
            String h = Integer.toHexString(resumen[i] & 0xFF);
            if (h.length() == 1) {
                hex += "0";
            }
            hex += h;
        }
        return hex.toUpperCase();
    }// toHexadecimal
}
