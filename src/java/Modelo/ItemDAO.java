/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Dto.ItemDTO;
import Utilidades.MyErrorExcepcion;
import Utilidades.PoolConection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author HenryRG
 */
public class ItemDAO {

    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Connection cnn;

    public ItemDAO() {
    }

    public ArrayList listarTodosItem(String filtro1) throws SQLException, MyErrorExcepcion {
        ArrayList<ItemDTO> milistaItem = new ArrayList();
        cnn = PoolConection.getInstance();
        try {
            pstmt = cnn.prepareStatement("SELECT ItemID, ItemNom, ValorUnitario, variablesfacturables.NombreVariableFact, \n"
                    + "tbIdCECO_Cod, FacturaCliente, Estado, tiposmoneda.nombreTipoMoneda, Corte, tbRangoImID, \n"
                    + "CordinadorEncargado FROM itemfacturable \n"
                    + "INNER JOIN variablesfacturables ON itemfacturable.tbidCodVariablesFacturables  =  variablesfacturables.CodVariablesFacturables\n"
                    + "INNER JOIN tiposmoneda \n"
                    + "ON itemfacturable.tbidtiposmoneda = tiposmoneda.idtiposmoneda \n" + filtro1 + "group BY ItemID");

            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    ItemDTO listaItem = new ItemDTO();
                    listaItem.setItemID(rs.getInt("ItemID"));
                    listaItem.setItemNombre(rs.getString("ItemNom"));
                    listaItem.setItemValorUnit(rs.getDouble("ValorUnitario"));
                    listaItem.setNombreVariableFac(rs.getString("variablesfacturables.NombreVariableFact"));
                    listaItem.setItemCeCo(rs.getString("tbIdCECO_Cod"));
                    listaItem.setItemFacturaClie(rs.getString("FacturaCliente"));
                    listaItem.setItemEstado(rs.getString("Estado"));
                    listaItem.setNombreMoneda(rs.getString("tiposmoneda.nombreTipoMoneda"));
                    listaItem.setItemCorte(rs.getInt("Corte"));
                    listaItem.setItemRangoImpacto(rs.getInt("tbRangoImID"));
                    listaItem.setItemCoordinador(rs.getString("CordinadorEncargado"));
                    milistaItem.add(listaItem);

                }
            }
            
        } catch (SQLException ex) {
            throw new MyErrorExcepcion("Se produjo un error " + ex.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ignore) {
                    throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ignore) {
                    throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
                }
            }
            if (cnn != null) 
                 try { PoolConection.closeConnection();} 
             catch (Exception ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getMessage());
             }
            
        }
        return milistaItem;
    }

    public String EliminarRegistroItem(int deletId) throws MyErrorExcepcion, SQLException {
        cnn = PoolConection.getInstance();
        int rst;
        String salida;
        String sql = "DELETE FROM itemfacturable WHERE ItemID=?";
        try {
            pstmt = cnn.prepareStatement(sql);
            pstmt.setInt(1, deletId);
            rst = pstmt.executeUpdate();
            if (rst > 0) {
                salida = "Se elimino el registro con exito";
            } else {
                salida = "no se puede eliminar el registro";
            }

        } catch (SQLException sqle) {
            salida = "Se produjo un erro " + sqle.getMessage();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ignore) {
                    throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ignore) {
                    throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
                }
            }
            if (cnn != null) 
                 try { PoolConection.closeConnection();} 
             catch (Exception ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getMessage());
             }
        }
        return salida;
    }

    public String creaItem(ItemDTO newItem) throws SQLException, MyErrorExcepcion {
        cnn = PoolConection.getInstance();
        String salida;
        try {
            int resultado;

            pstmt = cnn.prepareStatement(" INSERT INTO itemfacturable (ItemID, ItemNom, ValorUnitario, tbidCodVariablesFacturables, tbIdCECO_Cod, FacturaCliente, Estado, tbidtiposmoneda, Corte, tbRangoImID, CordinadorEncargado) \n "
                    + " VALUES (Null, ?, ?, ?, ?, ?, 1, ?, ?, ?, ?)");

            pstmt.setString(1, newItem.getItemNombre());
            pstmt.setDouble(2, newItem.getItemValorUnit());
            pstmt.setInt(3, newItem.getItemVariableFac());
            pstmt.setString(4, newItem.getItemCeCo());
            pstmt.setString(5, newItem.getItemFacturaClie());
            pstmt.setInt(6, newItem.getItemTipoMoneda());
            pstmt.setInt(7, newItem.getItemCorte());
            pstmt.setInt(8, newItem.getItemRangoImpacto());
            pstmt.setString(9, newItem.getItemCoordinador());
            resultado = pstmt.executeUpdate();
            if (resultado != 0) {
                salida = "Se a registrdo la informacion con exito " + resultado + "bases actualizadas";
            } else {
                salida = "Ha ocurrido un problema al crear la linea telefonica . escriba a marlonrobayo@gmail.com";
            }
        } catch (SQLException sqle) {
            salida = "ocurrio la siguiente exepcio: " + sqle.getMessage();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ignore) {
                    throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ignore) {
                    throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
                }
            }
            if (cnn != null) 
                 try { PoolConection.closeConnection();} 
             catch (Exception ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getMessage());
             }

        }
        return salida;
    }

    public String modificarItem(ItemDTO newUser, int pk2) throws SQLException, MyErrorExcepcion {
        cnn = PoolConection.getInstance();
        String salida = "";
        int rst;
        String sql = "UPDATE  itemfacturable SET ItemNom=?, ValorUnitario=?, tbidCodVariablesFacturables=?, tbIdCECO_Cod=?, \n"
                + "FacturaCliente=?, Estado=?, tbidtiposmoneda=?, Corte=?, tbRangoImID=?, CordinadorEncargado=?\n"
                + "WHERE ItemID=?";

        try {
            pstmt = cnn.prepareStatement(sql);
            pstmt.setInt(11, pk2);
            pstmt.setString(1, newUser.getItemNombre());
            pstmt.setDouble(2, newUser.getItemValorUnit());
            pstmt.setInt(3, newUser.getItemVariableFac());
            pstmt.setString(4, newUser.getItemCeCo());
            pstmt.setString(5, newUser.getItemFacturaClie());
            pstmt.setInt(6, 1);
            pstmt.setInt(7, newUser.getItemTipoMoneda());
            pstmt.setInt(8, newUser.getItemCorte());
            pstmt.setInt(9, newUser.getItemRangoImpacto());
            pstmt.setString(10, newUser.getItemCoordinador());
            rst = pstmt.executeUpdate();

            if (rst > 0) {
                salida = "Se actualizo el registro con exito";
            } else {
                salida = "No se actualizo elarchivo presentamos problemas intentelo mas tarde";
            }

        } catch (SQLException sqle) {
            salida = "Se produjo elo error" + sqle.getMessage();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ignore) {
                    throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ignore) {
                    throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
                }
            }
            if (cnn != null) 
                 try { PoolConection.closeConnection();} 
             catch (Exception ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getMessage());
             }
            
        }
        return salida;
    }

    public ItemDTO listarItemByID(int pkByID) throws SQLException, MyErrorExcepcion {
        cnn = PoolConection.getInstance();
        ItemDTO itemlisID = new ItemDTO();
        String sql = "SELECT ItemID, ItemNom, ValorUnitario, tbidCodVariablesFacturables, tbIdCECO_Cod, FacturaCliente, Estado, tbidtiposmoneda, Corte, tbRangoImID, CordinadorEncargado\n"
                + "FROM itemfacturable\n"
                + "WHERE ItemID=?";

        try {
            pstmt = cnn.prepareStatement(sql);
            pstmt.setInt(1, pkByID);
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    itemlisID.setItemID(rs.getInt("ItemID"));
                    itemlisID.setItemNombre(rs.getString("ItemNom"));
                    itemlisID.setItemValorUnit(rs.getDouble("ValorUnitario"));
                    itemlisID.setItemVariableFac(rs.getInt("tbidCodVariablesFacturables"));
                    itemlisID.setItemCeCo(rs.getString("tbIdCECO_Cod"));
                    itemlisID.setItemFacturaClie(rs.getString("FacturaCliente"));
                    itemlisID.setItemEstado(rs.getString("Estado"));
                    itemlisID.setItemTipoMoneda(rs.getInt("tbidtiposmoneda"));
                    itemlisID.setItemCorte(rs.getInt("Corte"));
                    itemlisID.setItemRangoImpacto(rs.getInt("tbRangoImID"));
                    itemlisID.setItemCoordinador(rs.getString("CordinadorEncargado"));

                }
            }
        } catch (SQLException sqle) {
            throw new MyErrorExcepcion("Se produjo un error " + sqle.getMessage());

        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ignore) {
                    throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ignore) {
                    throw new MyErrorExcepcion("error al close.. " + ignore.getSQLState());
                }
            }
            if (cnn != null) 
                 try { PoolConection.closeConnection();} 
             catch (Exception ignore) {
             throw new MyErrorExcepcion("error al close.. " + ignore.getMessage());
             }

        }

        return itemlisID;
    }

}
