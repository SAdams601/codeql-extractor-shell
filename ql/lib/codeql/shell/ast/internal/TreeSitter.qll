/**
* CodeQL library for SHELL
          * Automatically generated from the tree-sitter grammar; do not edit
*/

import codeql.Locations as L

/** Holds if the database is an overlay. */overlay[local] private predicate isOverlay() { databaseMetadata("isOverlay", "true") }

/** Holds if `loc` is in the `file` and is part of the overlay base database. */overlay[local] private predicate discardableLocation(@file file, @location_default loc) { (not (isOverlay())) and (locations_default(loc, file, _, _, _, _)) }

/** Holds if `loc` should be discarded, because it is part of the overlay base and is in a file that was also extracted as part of the overlay database. */overlay[discard_entity] private predicate discardLocation(@location_default loc) { exists(@file file, string path | files(file, path) | (discardableLocation(file, loc)) and (overlayChangedFiles(path))) }

overlay[local] module SHELL { 
  /** The base class for all AST nodes */class AstNode extends @shell_ast_node { 
  /** Gets a string representation of this element. */string toString() { result = this.getAPrimaryQlClass() }
  /** Gets the location of this element. */final L::Location getLocation() { shell_ast_node_location(this, result) }
  /** Gets the parent of this element. */final AstNode getParent() { shell_ast_node_parent(this, result, _) }
  /** Gets the index of this node among the children of its parent. */final int getParentIndex() { shell_ast_node_parent(this, _, result) }
  /** Gets a field or child node of this node. */AstNode getAFieldOrChild() { none() }
  /** Gets the name of the primary QL class for this element. */string getAPrimaryQlClass() { result = "???" }
  /** Gets a comma-separated list of the names of the primary CodeQL classes to which this element belongs. */string getPrimaryQlClasses() { result = concat(this.getAPrimaryQlClass(), ",") }
}
  /** A token. */class Token extends @shell_token, AstNode { 
  /** Gets the value of this token. */final string getValue() { shell_tokeninfo(this, _, result) }
  /** Gets a string representation of this element. */final override string toString() { result = this.getValue() }
  /** Gets the name of the primary QL class for this element. */override string getAPrimaryQlClass() { result = "Token" }
}
  /** A reserved word. */class ReservedWord extends @shell_reserved_word, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "ReservedWord" }
}
  /** Gets the file containing the given `node`. */private @file getNodeFile(@shell_ast_node node) { exists(@location_default loc | shell_ast_node_location(node, loc) | locations_default(loc, result, _, _, _, _)) }
  /** Holds if `node` is in the `file` and is part of the overlay base database. */private predicate discardableAstNode(@file file, @shell_ast_node node) { (not (isOverlay())) and (file = getNodeFile(node)) }
  /** Holds if `node` should be discarded, because it is part of the overlay base and is in a file that was also extracted as part of the overlay database. */overlay[discard_entity] private predicate discardAstNode(@shell_ast_node node) { exists(@file file, string path | files(file, path) | (discardableAstNode(file, node)) and (overlayChangedFiles(path))) }
  class UnderscoreExpression extends @shell_underscore_expression, AstNode { 
}
  class UnderscorePrimaryExpression extends @shell_underscore_primary_expression, AstNode { 
}
  class UnderscoreStatement extends @shell_underscore_statement, AstNode { 
}
  /** A class representing `ansi_c_string` tokens. */class AnsiCString extends @shell_token_ansi_c_string, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "AnsiCString" }
}
  /** A class representing `arithmetic_expansion` nodes. */class ArithmeticExpansion extends @shell_arithmetic_expansion, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "ArithmeticExpansion" }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { shell_arithmetic_expansion_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_arithmetic_expansion_child(this, _, result)) }
}
  /** A class representing `array` nodes. */class Array extends @shell_array, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "Array" }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { shell_array_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_array_child(this, _, result)) }
}
  /** A class representing `binary_expression` nodes. */class BinaryExpression extends @shell_binary_expression, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "BinaryExpression" }
  /** Gets the node corresponding to the field `left`. */final AstNode getLeft() { shell_binary_expression_left(this, result) }
  /** Gets the node corresponding to the field `operator`. */final AstNode getOperator() { shell_binary_expression_def(this, result) }
  /** Gets the node corresponding to the field `right`. */final AstNode getRight(int i) { shell_binary_expression_right(this, i, result) }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { shell_binary_expression_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_binary_expression_left(this, result)) or (shell_binary_expression_def(this, result)) or (shell_binary_expression_right(this, _, result)) or (shell_binary_expression_child(this, _, result)) }
}
  /** A class representing `brace_expression` nodes. */class BraceExpression extends @shell_brace_expression, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "BraceExpression" }
  /** Gets the `i`th child of this node. */final Number getChild(int i) { shell_brace_expression_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_brace_expression_child(this, _, result)) }
}
  /** A class representing `c_style_for_statement` nodes. */class CStyleForStatement extends @shell_c_style_for_statement, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "CStyleForStatement" }
  /** Gets the node corresponding to the field `body`. */final AstNode getBody() { shell_c_style_for_statement_def(this, result) }
  /** Gets the node corresponding to the field `condition`. */final AstNode getCondition(int i) { shell_c_style_for_statement_condition(this, i, result) }
  /** Gets the node corresponding to the field `initializer`. */final AstNode getInitializer(int i) { shell_c_style_for_statement_initializer(this, i, result) }
  /** Gets the node corresponding to the field `update`. */final AstNode getUpdate(int i) { shell_c_style_for_statement_update(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_c_style_for_statement_def(this, result)) or (shell_c_style_for_statement_condition(this, _, result)) or (shell_c_style_for_statement_initializer(this, _, result)) or (shell_c_style_for_statement_update(this, _, result)) }
}
  /** A class representing `case_item` nodes. */class CaseItem extends @shell_case_item, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "CaseItem" }
  /** Gets the node corresponding to the field `fallthrough`. */final AstNode getFallthrough() { shell_case_item_fallthrough(this, result) }
  /** Gets the node corresponding to the field `termination`. */final ReservedWord getTermination() { shell_case_item_termination(this, result) }
  /** Gets the node corresponding to the field `value`. */final AstNode getValue(int i) { shell_case_item_value(this, i, result) }
  /** Gets the `i`th child of this node. */final UnderscoreStatement getChild(int i) { shell_case_item_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_case_item_fallthrough(this, result)) or (shell_case_item_termination(this, result)) or (shell_case_item_value(this, _, result)) or (shell_case_item_child(this, _, result)) }
}
  /** A class representing `case_statement` nodes. */class CaseStatement extends @shell_case_statement, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "CaseStatement" }
  /** Gets the node corresponding to the field `value`. */final AstNode getValue() { shell_case_statement_def(this, result) }
  /** Gets the `i`th child of this node. */final CaseItem getChild(int i) { shell_case_statement_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_case_statement_def(this, result)) or (shell_case_statement_child(this, _, result)) }
}
  /** A class representing `command` nodes. */class Command extends @shell_command, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "Command" }
  /** Gets the node corresponding to the field `argument`. */final AstNode getArgument(int i) { shell_command_argument(this, i, result) }
  /** Gets the node corresponding to the field `name`. */final CommandName getName() { shell_command_def(this, result) }
  /** Gets the node corresponding to the field `redirect`. */final AstNode getRedirect(int i) { shell_command_redirect(this, i, result) }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { shell_command_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_command_argument(this, _, result)) or (shell_command_def(this, result)) or (shell_command_redirect(this, _, result)) or (shell_command_child(this, _, result)) }
}
  /** A class representing `command_name` nodes. */class CommandName extends @shell_command_name, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "CommandName" }
  /** Gets the child of this node. */final AstNode getChild() { shell_command_name_def(this, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_command_name_def(this, result)) }
}
  /** A class representing `command_substitution` nodes. */class CommandSubstitution extends @shell_command_substitution, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "CommandSubstitution" }
  /** Gets the node corresponding to the field `redirect`. */final FileRedirect getRedirect() { shell_command_substitution_redirect(this, result) }
  /** Gets the `i`th child of this node. */final UnderscoreStatement getChild(int i) { shell_command_substitution_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_command_substitution_redirect(this, result)) or (shell_command_substitution_child(this, _, result)) }
}
  /** A class representing `comment` tokens. */class Comment extends @shell_token_comment, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "Comment" }
}
  /** A class representing `compound_statement` nodes. */class CompoundStatement extends @shell_compound_statement, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "CompoundStatement" }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { shell_compound_statement_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_compound_statement_child(this, _, result)) }
}
  /** A class representing `concatenation` nodes. */class Concatenation extends @shell_concatenation, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "Concatenation" }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { shell_concatenation_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_concatenation_child(this, _, result)) }
}
  /** A class representing `declaration_command` nodes. */class DeclarationCommand extends @shell_declaration_command, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "DeclarationCommand" }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { shell_declaration_command_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_declaration_command_child(this, _, result)) }
}
  /** A class representing `do_group` nodes. */class DoGroup extends @shell_do_group, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "DoGroup" }
  /** Gets the `i`th child of this node. */final UnderscoreStatement getChild(int i) { shell_do_group_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_do_group_child(this, _, result)) }
}
  /** A class representing `elif_clause` nodes. */class ElifClause extends @shell_elif_clause, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "ElifClause" }
  /** Gets the `i`th child of this node. */final UnderscoreStatement getChild(int i) { shell_elif_clause_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_elif_clause_child(this, _, result)) }
}
  /** A class representing `else_clause` nodes. */class ElseClause extends @shell_else_clause, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "ElseClause" }
  /** Gets the `i`th child of this node. */final UnderscoreStatement getChild(int i) { shell_else_clause_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_else_clause_child(this, _, result)) }
}
  /** A class representing `expansion` nodes. */class Expansion extends @shell_expansion, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "Expansion" }
  /** Gets the node corresponding to the field `operator`. */final AstNode getOperator(int i) { shell_expansion_operator(this, i, result) }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { shell_expansion_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_expansion_operator(this, _, result)) or (shell_expansion_child(this, _, result)) }
}
  /** A class representing `extglob_pattern` tokens. */class ExtglobPattern extends @shell_token_extglob_pattern, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "ExtglobPattern" }
}
  /** A class representing `file_descriptor` tokens. */class FileDescriptor extends @shell_token_file_descriptor, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "FileDescriptor" }
}
  /** A class representing `file_redirect` nodes. */class FileRedirect extends @shell_file_redirect, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "FileRedirect" }
  /** Gets the node corresponding to the field `descriptor`. */final FileDescriptor getDescriptor() { shell_file_redirect_descriptor(this, result) }
  /** Gets the node corresponding to the field `destination`. */final AstNode getDestination(int i) { shell_file_redirect_destination(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_file_redirect_descriptor(this, result)) or (shell_file_redirect_destination(this, _, result)) }
}
  /** A class representing `for_statement` nodes. */class ForStatement extends @shell_for_statement, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "ForStatement" }
  /** Gets the node corresponding to the field `body`. */final DoGroup getBody() { shell_for_statement_def(this, result, _) }
  /** Gets the node corresponding to the field `value`. */final AstNode getValue(int i) { shell_for_statement_value(this, i, result) }
  /** Gets the node corresponding to the field `variable`. */final VariableName getVariable() { shell_for_statement_def(this, _, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_for_statement_def(this, result, _)) or (shell_for_statement_value(this, _, result)) or (shell_for_statement_def(this, _, result)) }
}
  /** A class representing `function_definition` nodes. */class FunctionDefinition extends @shell_function_definition, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "FunctionDefinition" }
  /** Gets the node corresponding to the field `body`. */final AstNode getBody() { shell_function_definition_def(this, result, _) }
  /** Gets the node corresponding to the field `name`. */final Word getName() { shell_function_definition_def(this, _, result) }
  /** Gets the node corresponding to the field `redirect`. */final AstNode getRedirect() { shell_function_definition_redirect(this, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_function_definition_def(this, result, _)) or (shell_function_definition_def(this, _, result)) or (shell_function_definition_redirect(this, result)) }
}
  /** A class representing `heredoc_body` nodes. */class HeredocBody extends @shell_heredoc_body, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "HeredocBody" }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { shell_heredoc_body_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_heredoc_body_child(this, _, result)) }
}
  /** A class representing `heredoc_content` tokens. */class HeredocContent extends @shell_token_heredoc_content, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "HeredocContent" }
}
  /** A class representing `heredoc_end` tokens. */class HeredocEnd extends @shell_token_heredoc_end, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "HeredocEnd" }
}
  /** A class representing `heredoc_redirect` nodes. */class HeredocRedirect extends @shell_heredoc_redirect, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "HeredocRedirect" }
  /** Gets the node corresponding to the field `argument`. */final AstNode getArgument(int i) { shell_heredoc_redirect_argument(this, i, result) }
  /** Gets the node corresponding to the field `descriptor`. */final FileDescriptor getDescriptor() { shell_heredoc_redirect_descriptor(this, result) }
  /** Gets the node corresponding to the field `operator`. */final AstNode getOperator() { shell_heredoc_redirect_operator(this, result) }
  /** Gets the node corresponding to the field `redirect`. */final AstNode getRedirect(int i) { shell_heredoc_redirect_redirect(this, i, result) }
  /** Gets the node corresponding to the field `right`. */final UnderscoreStatement getRight() { shell_heredoc_redirect_right(this, result) }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { shell_heredoc_redirect_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_heredoc_redirect_argument(this, _, result)) or (shell_heredoc_redirect_descriptor(this, result)) or (shell_heredoc_redirect_operator(this, result)) or (shell_heredoc_redirect_redirect(this, _, result)) or (shell_heredoc_redirect_right(this, result)) or (shell_heredoc_redirect_child(this, _, result)) }
}
  /** A class representing `heredoc_start` tokens. */class HeredocStart extends @shell_token_heredoc_start, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "HeredocStart" }
}
  /** A class representing `herestring_redirect` nodes. */class HerestringRedirect extends @shell_herestring_redirect, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "HerestringRedirect" }
  /** Gets the node corresponding to the field `descriptor`. */final FileDescriptor getDescriptor() { shell_herestring_redirect_descriptor(this, result) }
  /** Gets the child of this node. */final AstNode getChild() { shell_herestring_redirect_def(this, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_herestring_redirect_descriptor(this, result)) or (shell_herestring_redirect_def(this, result)) }
}
  /** A class representing `if_statement` nodes. */class IfStatement extends @shell_if_statement, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "IfStatement" }
  /** Gets the node corresponding to the field `condition`. */final AstNode getCondition(int i) { shell_if_statement_condition(this, i, result) }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { shell_if_statement_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_if_statement_condition(this, _, result)) or (shell_if_statement_child(this, _, result)) }
}
  /** A class representing `list` nodes. */class List extends @shell_list, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "List" }
  /** Gets the `i`th child of this node. */final UnderscoreStatement getChild(int i) { shell_list_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_list_child(this, _, result)) }
}
  /** A class representing `negated_command` nodes. */class NegatedCommand extends @shell_negated_command, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "NegatedCommand" }
  /** Gets the child of this node. */final AstNode getChild() { shell_negated_command_def(this, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_negated_command_def(this, result)) }
}
  /** A class representing `number` nodes. */class Number extends @shell_number, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "Number" }
  /** Gets the child of this node. */final AstNode getChild() { shell_number_child(this, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_number_child(this, result)) }
}
  /** A class representing `parenthesized_expression` nodes. */class ParenthesizedExpression extends @shell_parenthesized_expression, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "ParenthesizedExpression" }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { shell_parenthesized_expression_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_parenthesized_expression_child(this, _, result)) }
}
  /** A class representing `pipeline` nodes. */class Pipeline extends @shell_pipeline, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "Pipeline" }
  /** Gets the `i`th child of this node. */final UnderscoreStatement getChild(int i) { shell_pipeline_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_pipeline_child(this, _, result)) }
}
  /** A class representing `postfix_expression` nodes. */class PostfixExpression extends @shell_postfix_expression, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "PostfixExpression" }
  /** Gets the node corresponding to the field `operator`. */final string getOperator() { exists(int value | shell_postfix_expression_def(this, value, _) | ((result = "++") and (value = 0)) or ((result = "--") and (value = 1))) }
  /** Gets the child of this node. */final AstNode getChild() { shell_postfix_expression_def(this, _, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_postfix_expression_def(this, _, result)) }
}
  /** A class representing `process_substitution` nodes. */class ProcessSubstitution extends @shell_process_substitution, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "ProcessSubstitution" }
  /** Gets the `i`th child of this node. */final UnderscoreStatement getChild(int i) { shell_process_substitution_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_process_substitution_child(this, _, result)) }
}
  /** A class representing `program` nodes. */class Program extends @shell_program, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "Program" }
  /** Gets the `i`th child of this node. */final UnderscoreStatement getChild(int i) { shell_program_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_program_child(this, _, result)) }
}
  /** A class representing `raw_string` tokens. */class RawString extends @shell_token_raw_string, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "RawString" }
}
  /** A class representing `redirected_statement` nodes. */class RedirectedStatement extends @shell_redirected_statement, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "RedirectedStatement" }
  /** Gets the node corresponding to the field `body`. */final UnderscoreStatement getBody() { shell_redirected_statement_body(this, result) }
  /** Gets the node corresponding to the field `redirect`. */final AstNode getRedirect(int i) { shell_redirected_statement_redirect(this, i, result) }
  /** Gets the child of this node. */final HerestringRedirect getChild() { shell_redirected_statement_child(this, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_redirected_statement_body(this, result)) or (shell_redirected_statement_redirect(this, _, result)) or (shell_redirected_statement_child(this, result)) }
}
  /** A class representing `regex` tokens. */class Regex extends @shell_token_regex, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "Regex" }
}
  /** A class representing `simple_expansion` nodes. */class SimpleExpansion extends @shell_simple_expansion, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "SimpleExpansion" }
  /** Gets the child of this node. */final AstNode getChild() { shell_simple_expansion_def(this, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_simple_expansion_def(this, result)) }
}
  /** A class representing `special_variable_name` tokens. */class SpecialVariableName extends @shell_token_special_variable_name, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "SpecialVariableName" }
}
  /** A class representing `string` nodes. */class String extends @shell_string__, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "String" }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { shell_string_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_string_child(this, _, result)) }
}
  /** A class representing `string_content` tokens. */class StringContent extends @shell_token_string_content, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "StringContent" }
}
  /** A class representing `subscript` nodes. */class Subscript extends @shell_subscript, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "Subscript" }
  /** Gets the node corresponding to the field `index`. */final AstNode getIndex() { shell_subscript_def(this, result, _) }
  /** Gets the node corresponding to the field `name`. */final VariableName getName() { shell_subscript_def(this, _, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_subscript_def(this, result, _)) or (shell_subscript_def(this, _, result)) }
}
  /** A class representing `subshell` nodes. */class Subshell extends @shell_subshell, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "Subshell" }
  /** Gets the `i`th child of this node. */final UnderscoreStatement getChild(int i) { shell_subshell_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_subshell_child(this, _, result)) }
}
  /** A class representing `ternary_expression` nodes. */class TernaryExpression extends @shell_ternary_expression, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "TernaryExpression" }
  /** Gets the node corresponding to the field `alternative`. */final AstNode getAlternative() { shell_ternary_expression_def(this, result, _, _) }
  /** Gets the node corresponding to the field `condition`. */final AstNode getCondition() { shell_ternary_expression_def(this, _, result, _) }
  /** Gets the node corresponding to the field `consequence`. */final AstNode getConsequence() { shell_ternary_expression_def(this, _, _, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_ternary_expression_def(this, result, _, _)) or (shell_ternary_expression_def(this, _, result, _)) or (shell_ternary_expression_def(this, _, _, result)) }
}
  /** A class representing `test_command` nodes. */class TestCommand extends @shell_test_command, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "TestCommand" }
  /** Gets the child of this node. */final AstNode getChild() { shell_test_command_child(this, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_test_command_child(this, result)) }
}
  /** A class representing `test_operator` tokens. */class TestOperator extends @shell_token_test_operator, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "TestOperator" }
}
  /** A class representing `translated_string` nodes. */class TranslatedString extends @shell_translated_string, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "TranslatedString" }
  /** Gets the child of this node. */final String getChild() { shell_translated_string_def(this, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_translated_string_def(this, result)) }
}
  /** A class representing `unary_expression` nodes. */class UnaryExpression extends @shell_unary_expression, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "UnaryExpression" }
  /** Gets the node corresponding to the field `operator`. */final AstNode getOperator() { shell_unary_expression_def(this, result, _) }
  /** Gets the child of this node. */final AstNode getChild() { shell_unary_expression_def(this, _, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_unary_expression_def(this, result, _)) or (shell_unary_expression_def(this, _, result)) }
}
  /** A class representing `unset_command` nodes. */class UnsetCommand extends @shell_unset_command, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "UnsetCommand" }
  /** Gets the `i`th child of this node. */final AstNode getChild(int i) { shell_unset_command_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_unset_command_child(this, _, result)) }
}
  /** A class representing `variable_assignment` nodes. */class VariableAssignment extends @shell_variable_assignment, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "VariableAssignment" }
  /** Gets the node corresponding to the field `name`. */final AstNode getName() { shell_variable_assignment_def(this, result, _) }
  /** Gets the node corresponding to the field `value`. */final AstNode getValue() { shell_variable_assignment_def(this, _, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_variable_assignment_def(this, result, _)) or (shell_variable_assignment_def(this, _, result)) }
}
  /** A class representing `variable_assignments` nodes. */class VariableAssignments extends @shell_variable_assignments, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "VariableAssignments" }
  /** Gets the `i`th child of this node. */final VariableAssignment getChild(int i) { shell_variable_assignments_child(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_variable_assignments_child(this, _, result)) }
}
  /** A class representing `variable_name` tokens. */class VariableName extends @shell_token_variable_name, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "VariableName" }
}
  /** A class representing `while_statement` nodes. */class WhileStatement extends @shell_while_statement, AstNode { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "WhileStatement" }
  /** Gets the node corresponding to the field `body`. */final DoGroup getBody() { shell_while_statement_def(this, result) }
  /** Gets the node corresponding to the field `condition`. */final AstNode getCondition(int i) { shell_while_statement_condition(this, i, result) }
  /** Gets a field or child node of this node. */final override AstNode getAFieldOrChild() { (shell_while_statement_def(this, result)) or (shell_while_statement_condition(this, _, result)) }
}
  /** A class representing `word` tokens. */class Word extends @shell_token_word, Token { 
  /** Gets the name of the primary QL class for this element. */final override string getAPrimaryQlClass() { result = "Word" }
}
}

