package main;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.print.PageFormat;
import java.awt.print.Printable;
import static java.awt.print.Printable.NO_SUCH_PAGE;
import static java.awt.print.Printable.PAGE_EXISTS;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;

public class Nota extends JDialog {
    private DefaultTableModel model;
    private JTextArea textArea;
    private JLabel lblTotalHarga;
    private JLabel lblUangPembayaran;
    private JLabel lblUangKembali;

    public Nota(JFrame parent, boolean modal) {
        super(parent, modal);
        initComponents();
    }

    private void initComponents() {
        setTitle("Nota Transaksi");
        setSize(400, 300);
        setLocationRelativeTo(null);
        
        textArea = new JTextArea();
        textArea.setEditable(false);
        JScrollPane scrollPane = new JScrollPane(textArea);
        add(scrollPane, BorderLayout.CENTER);
        
        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(3, 2));
        
        panel.add(new JLabel("      Total Harga:"));
        lblTotalHarga = new JLabel();
        panel.add(lblTotalHarga);
        
        panel.add(new JLabel("      Uang Pembayaran:"));
        lblUangPembayaran = new JLabel();
        panel.add(lblUangPembayaran);
        
        panel.add(new JLabel("      Uang Kembali:"));
        lblUangKembali = new JLabel();
        panel.add(lblUangKembali);
        
        add(panel, BorderLayout.SOUTH);
        
        JButton printButton = new JButton("Print");
        printButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                printNota();
            }
        });
        
        JButton closeButton = new JButton("Close");
        closeButton.addActionListener(e -> dispose());
        
        JPanel buttonPanel = new JPanel();
        buttonPanel.add(printButton);
        buttonPanel.add(closeButton);
        add(buttonPanel, BorderLayout.NORTH);
    }

    public void setMODEL(DefaultTableModel model) {
        this.model = model;
        generateNota();
    }

    private void generateNota() {
        StringBuilder notaText = new StringBuilder();
        notaText.append("Nota Transaksi\n");
        notaText.append("====================\n");
        notaText.append("ID\tNama Produk\tQty\tHarga\n");
        notaText.append("---------------------\n");
        
        for (int i = 0; i < model.getRowCount(); i++) {
            int id = (int) model.getValueAt(i, 0);
            String productName = (String) model.getValueAt(i, 1);
            int qty = (int) model.getValueAt(i, 2);
            double price = (double) model.getValueAt(i, 3);
            notaText.append(id).append("\t").append(productName).append("\t").append(qty).append("\t").append(price).append("\n");
        }
        
        notaText.append("====================\n");
        textArea.setText(notaText.toString());
    }

    public void setTotalHarga(String totalHarga) {
        lblTotalHarga.setText(totalHarga);
    }

    public void setUangPembayaran(String uangPembayaran) {
        lblUangPembayaran.setText(uangPembayaran);
    }

    public void setUangKembali(String uangKembali) {
        lblUangKembali.setText(uangKembali);
    }

    private void printNota() {
    try {
        // Create a PrinterJob instance
        PrinterJob printerJob = PrinterJob.getPrinterJob();
        
        // Set the printable content
        printerJob.setPrintable(new Printable() {
            public int print(Graphics graphics, PageFormat pageFormat, int pageIndex) throws PrinterException {
                if (pageIndex > 0) {
                    return NO_SUCH_PAGE;
                }
                
                Graphics2D g2d = (Graphics2D) graphics;
                // Move the origin to account for page margins
                g2d.translate(pageFormat.getImageableX(), pageFormat.getImageableY());
                
                // Calculate font metrics
                Font regularFont = new Font("Monospaced", Font.PLAIN, 10);
                Font boldFont = new Font("Monospaced", Font.BOLD, 10);
                g2d.setFont(regularFont);
                FontMetrics fm = g2d.getFontMetrics();
                int lineHeight = fm.getHeight();
                
                int y = lineHeight; // Starting y position
                
                // Print header
                g2d.setFont(boldFont);
                String header = "NOTA TRANSAKSI";
                int headerWidth = fm.stringWidth(header);
                int x = (int)((pageFormat.getImageableWidth() - headerWidth) / 2);
                g2d.drawString(header, x, y);
                y += lineHeight;
                
                // Print separator line
                String separator = "====================";
                g2d.drawString(separator, 0, y);
                y += lineHeight;
                
                // Print column headers
                g2d.setFont(regularFont);
                g2d.drawString("ID  Nama Produk      Qty    Harga", 0, y);
                y += lineHeight;
                
                g2d.drawString("----------------------------------------", 0, y);
                y += lineHeight;
                
                // Print items
                for (int i = 0; i < model.getRowCount(); i++) {
                    String id = String.format("%-4s", model.getValueAt(i, 0).toString());
                    String name = String.format("%-15s", model.getValueAt(i, 1).toString());
                    String qty = String.format("%-7s", model.getValueAt(i, 2).toString());
                    String price = String.format("%-10s", model.getValueAt(i, 3).toString());
                    
                    g2d.drawString(id + name + qty + price, 0, y);
                    y += lineHeight;
                }
                
                // Print separator
                g2d.drawString("----------------------------------------", 0, y);
                y += lineHeight;
                
                // Print totals
                g2d.drawString("Total Harga    : " + lblTotalHarga.getText(), 0, y);
                y += lineHeight;
                g2d.drawString("Pembayaran     : Rp." + lblUangPembayaran.getText(), 0, y);
                y += lineHeight;
                g2d.drawString("Kembalian      : " + lblUangKembali.getText(), 0, y);
                y += lineHeight * 2;
                
                // Print footer
                g2d.drawString("Terima kasih atas kunjungan Anda", 0, y);
                
                return PAGE_EXISTS;
            }
        });
        
        // Show print dialog and print if user clicks OK
        if (printerJob.printDialog()) {
            try {
                printerJob.print();
                JOptionPane.showMessageDialog(this, "Nota berhasil dicetak!", "Informasi", JOptionPane.INFORMATION_MESSAGE);
            } catch (PrinterException ex) {
                JOptionPane.showMessageDialog(this, "Error saat mencetak: " + ex.getMessage(), 
                    "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    } catch (Exception ex) {
        JOptionPane.showMessageDialog(this, "Error saat mencetak: " + ex.getMessage(), 
            "Error", JOptionPane.ERROR_MESSAGE);
    }
}
}