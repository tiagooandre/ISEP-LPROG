// Generated from Hello.g4 by ANTLR 4.9.2
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link HelloParser}.
 */
public interface HelloListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link HelloParser#inicio}.
	 * @param ctx the parse tree
	 */
	void enterInicio(HelloParser.InicioContext ctx);
	/**
	 * Exit a parse tree produced by {@link HelloParser#inicio}.
	 * @param ctx the parse tree
	 */
	void exitInicio(HelloParser.InicioContext ctx);
}