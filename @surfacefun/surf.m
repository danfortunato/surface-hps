function surf(f, varargin)
%SURF   3-D colored surface of a SURFACEFUN.
%   SURF(F) plots a colored parametric surface whose color is defined by
%   the values of the SURFACEFUN F.
%
%   SURF(..., 'PropertyName', PropertyValue, ...) sets the value of the
%   specified surface property. Multiple property values can be set with a
%   single statement.
%
%   See also PLOT, CONTOUR, MESH.

holdState = ishold();

for k = 1:length(f)
    u = f.vals{k};
    if ( ~isreal(u) )
        %u = abs(u);
        u = real(u);
    end
    x = f.domain.x{k};
    y = f.domain.y{k};
    z = f.domain.z{k};
    surface(x, y, z, u, varargin{:});
    hold on
end

if ( ~holdState )
    view(3)
    shading interp
    axis equal
    hold off
end

end
