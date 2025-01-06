package main;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

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
        
        panel.add(new JLabel("Total Harga:"));
        lblTotalHarga = new JLabel();
        panel.add(lblTotalHarga);
        
        panel.add(new JLabel("Uang Pembayaran:"));
        lblUangPembayaran = new JLabel();
        panel.add(lblUangPembayaran);
        
        panel.add(new JLabel("Uang Kembali:"));
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
        // Implement printing logic here
        JOptionPane.showMessageDialog(this, "Printing functionality not implemented yet.");
    }
}