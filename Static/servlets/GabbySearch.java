import java.applet.Applet;
import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.Graphics;
import java.awt.Color;

public class GabbySearch extends Applet {
  private JTextField textField;
  private JButton button;
  
  public void init() {
    this.setBackground(new Color(163, 184, 204));
      
    textField = new JTextField("", 36);
    button = new JButton("Buscar");
    
    this.add(textField);
    this.add(button);
  }
  
}