import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits import mplot3d

fig = plt.figure(figsize=(12, 8))
ax3d = plt.axes(projection="3d")

xdata = np.linspace(3,-3,100)
ydata = np.linspace(-3,3,100)
X,Y = np.meshgrid(xdata,ydata)
Z = 1/(1+np.exp(-X-Y))

ax3d.plot_surface(X, Y, Z, cmap='plasma')
ax3d.set_xlabel('Salinité')
ax3d.set_ylabel('Température')
ax3d.set_zlabel("Probabilité d'occurence")

# Setting custom tick positions and labels
xticks = [-3, -2, -1, 0, 1, 2, 3]
yticks = [-3, -2, -1, 0, 1, 2, 3]
zticks = [0, 0.25, 0.5, 0.75, 1]

ax3d.set_xticks(xticks)
ax3d.set_yticks(yticks)
ax3d.set_zticks(zticks)

ax3d.set_xticklabels([23, 25, 27, 29, 31, 33, 35])
ax3d.set_yticklabels([8, 10, 12, 14, 16, 18, 20])

plt.tight_layout()
plt.savefig(
    'Src/02-Introduction/figures/hypervolume_niche.png',
    dpi=300,
    # bbox_inches='tight',
)

plt.close('all')