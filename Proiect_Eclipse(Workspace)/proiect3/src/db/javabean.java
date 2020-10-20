package db;

import java.sql.*;

public class javabean {
	String error;
	Connection con;

	public javabean() {
	}

	public void connect() throws ClassNotFoundException, SQLException, Exception {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proiect", "root", "Dy@bOLyC21");
		} catch (ClassNotFoundException cnfe) {
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} catch (SQLException cnfe) {
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
			throw new Exception(error);
		}
	} // connect()

	public void connect(String bd) throws ClassNotFoundException, SQLException, Exception {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + bd, "root", "Dy@bOLyC21");
		} catch (ClassNotFoundException cnfe) {
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} catch (SQLException cnfe) {
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
			throw new Exception(error);
		}
	} // connect(String bd)

	public void connect(String bd, String ip) throws ClassNotFoundException, SQLException, Exception {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://" + ip + ":3306/" + bd, "root", "Dy@bOLyC21");
		} catch (ClassNotFoundException cnfe) {
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} catch (SQLException cnfe) {
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
			throw new Exception(error);
		}
	} // connect(String bd, String ip)

	public void disconnect() throws SQLException {
		try {
			if (con != null) {
				con.close();
			}
		} catch (SQLException sqle) {
			error = ("SQLException: Nu se poate inchide conexiunea la baza de date.");
			throw new SQLException(error);
		}
	} // disconnect()

	public void adaugaClient(String Nume, String Prenume, String Adresa) throws SQLException, Exception {
		if (con != null) {
			try {
// create a prepared SQL statement
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("insert into `proiect`.`clienti`(Nume, Prenume, Adresa) values('" + Nume + "', '" + Prenume
						+ "', '" + Adresa + "');");
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of adaugaClient()
	public void adaugaCumparaturi(int ClientID, int ProdusID, String TipAlimente) throws SQLException, Exception {
		if (con != null) {
			try {
// create a prepared SQL statement
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("insert into `proiect`.`cumparaturi`(ClientID, ProdusID, TipAlimente) values('" + ClientID + "', '" + ProdusID + "', '" + TipAlimente + "');");
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of adaugaClient()
	public void adaugaDistribuitor(int ProdusID, int ProducatorID, String Nume) throws SQLException, Exception {
		if (con != null) {
			try {
// create a prepared SQL statement
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("insert into `proiect`.`distribuitor`(ProdusID, ProducatorID, Nume) values('" + ProdusID + "', '" + ProducatorID + "', '" + Nume + "');");
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of adaugaClient()
	
	public void adaugaProducator(String Denumire, String TaraOrigine, String Adresa) throws SQLException, Exception {
		if (con != null) {
			try {
// create a prepared SQL statement
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("insert into `proiect`.`producator`(Denumire, TaraOrigine, Adresa) values('" + Denumire + "', '" + TaraOrigine + "', '" + Adresa + "');");
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of adaugaClient()
	
	public void adaugaProdusAlimentar(String Denumire, String DataProducere, String DataExpirare) throws SQLException, Exception {
		if (con != null) {
			try {
// create a prepared SQL statement
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("insert into `proiect`.`produsalimentar`(Denumire, DataProducere, DataExpirare) values('" + Denumire + "', '" + DataProducere + "', '" + DataExpirare + "');");
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of adaugaClient()
	
	public ResultSet vedeTabela(String tabel) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			String queryString = ("select * from `proiect`.`" + tabel + "`;");
			Statement stmt = con.createStatement(/*
													 * ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY
													 */);
			rs = stmt.executeQuery(queryString);
//System.out.println("111***********************************************************************");
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // vedeTabela()
	
	  public ResultSet vedeCumparaturi() throws SQLException, Exception {
	        ResultSet rs = null;
	        try {
	            String queryString = ("select a.Nume, a.Prenume, a.Adresa, b.Denumire, b.DataProducere, b.DataExpirare, c.CumparaturiID , c.ClientID ClientID_cumparaturi, c.ProdusID ProdusID_cumparaturi, c.TipAlimente from clienti a, produsalimentar b, cumparaturi c where a.ClientID = c.ClientID and b.ProdusID = c.ProdusID;");
	            Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
	            rs = stmt.executeQuery(queryString);
	        } catch (SQLException sqle) {
	            error = "SQLException: Interogarea nu a fost posibila.";
	            throw new SQLException(error);
	        } catch (Exception e) {
	            error = "A aparut o exceptie in timp ce se extrageau datele.";
	            throw new Exception(error);
	        }
	        return rs;
	    } // vedeCumparaturi
	  public ResultSet vedeDistribuitori() throws SQLException, Exception {
	        ResultSet rs = null;
	        try {
	            String queryString = ("select a.Denumire, a.DataProducere, a.DataExpirare, b.Denumire, b.TaraOrigine, b.Adresa, c.DistribuitorID , c.ProdusID ProdusID_distribuitor, c.ProducatorID ProducatorID_distribuitor, c.Nume from produsalimentar a, producator b, distribuitor c where a.ProdusID = c.ProdusID and b.ProducatorID = c.ProducatorID;");
	            Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
	            rs = stmt.executeQuery(queryString);
	        } catch (SQLException sqle) {
	            error = "SQLException: Interogarea nu a fost posibila.";
	            throw new SQLException(error);
	        } catch (Exception e) {
	            error = "A aparut o exceptie in timp ce se extrageau datele.";
	            throw new Exception(error);
	        }
	        return rs;
	    } // vedeCumparaturi
	
	public void stergeDateTabela(String[] primaryKeys, String tabela, String dupaID) throws SQLException, Exception {
		if (con != null) {
			try {
// create a prepared SQL statement
				long aux;
				PreparedStatement delete;
				delete = con.prepareStatement("DELETE FROM " + tabela + " WHERE " + dupaID + "=?;");
				for (int i = 0; i < primaryKeys.length; i++) {
					aux = java.lang.Long.parseLong(primaryKeys[i]);
					delete.setLong(1, aux);
					delete.execute();
				}
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			} catch (Exception e) {
				error = "A aparut o exceptie in timp ce erau sterse inregistrarile.";
				throw new Exception(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of stergeDateTabela()

	public void stergeTabela(String tabela) throws SQLException, Exception {
		if (con != null) {
			try {
// create a prepared SQL statement
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("delete from " + tabela + ";");
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Stergere nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of stergeTabela()

	public void modificaTabela(String tabela, String IDTabela, long ID, String[] campuri, String[] valori)
			throws SQLException, Exception {
		String update = "update " + tabela + " set ";
		String temp = "";
		if (con != null) {
			try {
				for (int i = 0; i < campuri.length; i++) {
					if (i != (campuri.length - 1))
						temp = temp + campuri[i] + "='" + valori[i] + "', ";
					else
						temp = temp + campuri[i] + "='" + valori[i] + "' where " + IDTabela + " = '" + ID + "';";
				}
				update = update + temp;
// create a prepared SQL statement
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate(update);
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of modificaTabela()

	public ResultSet intoarceLinie(String tabela, long ID) throws SQLException, Exception {
		ResultSet rs = null;
		try {
// Execute query
			String queryString = ("SELECT * FROM " + tabela + " where BoalaID=" + ID + ";");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(queryString); // sql exception
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // end of intoarceLinie()

	public ResultSet intoarceLinieDupaId(String tabela, String denumireId, long ID) throws SQLException, Exception {
		ResultSet rs = null;
		try {
// Execute query
			String queryString = ("SELECT * FROM " + tabela + " where " + denumireId + "=" + ID + ";");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(queryString); // sql exception
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // end of intoarceLinieDupaId()
	
	 public ResultSet intoarceCumparaturiId(int ID) throws SQLException, Exception {
	        ResultSet rs = null;
	        try {
	// Execute query
	            String queryString = ("select a.Nume, a.Prenume, a.Adresa, b.Denumire, b.DataProducere, b.DataExpirare, c.CumparaturiID , c.ClientID ClientID_cumparaturi, c.ProdusID ProdusID_cumparaturi, c.TipAlimente from clienti a, produsalimentar b, cumparaturi c where a.ClientID = c.ClientID and b.ProdusID = c.ProdusID and CumparaturiID = '"+ ID +"';");
	            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	            rs = stmt.executeQuery(queryString); //sql exception
	        } catch (SQLException sqle) {
	            error = "SQLException: Interogarea nu a fost posibila.";
	            throw new SQLException(error);
	        } catch (Exception e) {
	            error = "A aparut o exceptie in timp ce se extrageau datele.";
	            throw new Exception(error);
	        }
	        return rs;
	    } // end of intoarceLinieDupaId()
	 public ResultSet intoarceDistribuitoriId(int ID) throws SQLException, Exception {
	        ResultSet rs = null;
	        try {
	// Execute query
	        	String queryString = ("select a.Denumire, a.DataProducere, a.DataExpirare, b.Denumire, b.TaraOrigine, b.Adresa, c.DistribuitorID , c.ProdusID ProdusID_distribuitor, c.ProducatorID ProducatorID_distribuitor, c.Nume from produsalimentar a, producator b, distribuitor c where a.ProdusID = c.ProdusID and b.ProducatorID = c.ProducatorID and DistribuitorID = '"+ ID +"';");
	            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	            rs = stmt.executeQuery(queryString); //sql exception
	        } catch (SQLException sqle) {
	            error = "SQLException: Interogarea nu a fost posibila.";
	            throw new SQLException(error);
	        } catch (Exception e) {
	            error = "A aparut o exceptie in timp ce se extrageau datele.";
	            throw new Exception(error);
	        }
	        return rs;
	    } // end of intoarceLinieDupaId()
}