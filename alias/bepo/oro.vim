:syntax clear
:syntax case match
:syntax match Identifier /thread [0-9]*/
:syntax keyword PreProc DEBUG 
:syntax match Type /\[[0-9]* [0-9.:]*\]\=/ 
:syntax match Todo /\[!!\]/
:syntax match Error / [a-zA-Z\.]*Exception/
:syntax match Todo /A new agent appeared: \w*/
:syntax match Underlined />> Got incoming request:/
:syntax keyword Statement find findForAgent add safeAdd addForAgent safeAddForAgent check checkConsistency remove removeForAgent clear clearForAgent update updateForAgent stats getInfos query lookup revise registerEvent clearEvent discriminate getDifferences save
:syntax keyword Todo reset
:syntax keyword Error inconsistent
