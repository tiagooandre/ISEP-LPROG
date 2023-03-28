import java.io.*;
import org.antlr.v4.runtime.*; import org.antlr.v4.runtime.tree.*;
public class Calc {
    public static void main(String[] args) throws IOException {
        FileInputStream fis = new FileInputStream(new File("teste.txt")); LabeledExprLexer lexer = new LabeledExprLexer(new ANTLRInputStream(fis)); CommonTokenStream tokens = new CommonTokenStream(lexer); LabeledExprParser parser = new LabeledExprParser(tokens);
        ParseTree tree = parser.prog(); // parse
        EvalVisitor eval = new EvalVisitor();
        eval.visit(tree);
    } }