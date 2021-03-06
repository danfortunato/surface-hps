function S = subsasgn(S, index, val)
%SUBSASGN   Subscripted assignment to a SURFACEOP object.
%   S.PROP = VAL allows property assignment for S.DOMAIN and S.PATCHES.
%
%   S.RHS = F is equivalent to UPDATERHS(S, F).
%
%   S() and S{} are not supported.
%
%   See also UPDATERHS.

switch index(1).type
    case '.'
        if ( strcmpi(index(1).subs, 'rhs') )
            S = updateRHS(S, val);
        else
            S = builtin('subsasgn', S, index, val);
        end

    otherwise
        error('SURFACEOP:subsasgn:unexpectedType', ...
            ['Unexpected index.type of ' index(1).type]);
end

end
