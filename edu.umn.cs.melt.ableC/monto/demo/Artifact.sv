grammar edu:umn:cs:melt:ableC:monto:demo;

import edu:umn:cs:melt:ableC:concretesyntax as cst;
-- import edu:umn:cs:melt:ableC:drivers:compile;
import edu:umn:cs:melt:ableC:drivers:monto;

parser extendedParser :: cst:Root {
  edu:umn:cs:melt:ableC:concretesyntax;
  edu:umn:cs:melt:exts:ableC:algebraicDataTypes;
  edu:umn:cs:melt:exts:ableC:cilk;
  edu:umn:cs:melt:exts:ableC:regex:regexLiterals;
  edu:umn:cs:melt:exts:ableC:regex:regexMatching;
  edu:umn:cs:melt:exts:ableC:regexPatternMatching;
} 

function main
IOVal<Integer> ::= args::[String] io_in::IO
{
  return driver(args, io_in, extendedParser);
}
