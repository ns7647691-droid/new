<!doctype html>
<html lang="en"><head>
<meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
<meta name="theme-color" content="#080d20"><title>Block Puzzle Elite Pro</title>
<style>
*{box-sizing:border-box;margin:0;padding:0;user-select:none;-webkit-tap-highlight-color:transparent}
body{min-height:100vh;background:radial-gradient(circle,#14203b,#050714);color:#f8fafc;font-family:system-ui,sans-serif;display:flex;justify-content:center;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}
.shell{width:100%;max-width:440px;padding:13px;display:flex;flex-direction:column;gap:13px}
.header,.hud,.board-wrap,.tray,.panel,.stat{background:#0d1326;border:1px solid #00eaff30;box-shadow:0 6px 18px #0005}
.header{padding:12px 15px;border-radius:18px;display:flex;justify-content:space-between;align-items:center}
.logo{font-weight:950;color:#00eaff;font-size:14px}.right{display:flex;gap:9px;align-items:center}
.pill{background:#18213b;border-radius:20px;padding:7px 12px;color:#fbbf24;font-weight:900}
button{border:0;cursor:pointer;color:white;font-weight:900}
.icon{width:38px;height:38px;border-radius:50%;background:#18213b;border:1px solid #00eaff55}
.screen{display:none;flex-direction:column;gap:13px}.screen.active{display:flex}
.hero{padding:23px 17px;border-radius:22px;text-align:center;background:linear-gradient(145deg,#172747,#0d1326);border:1px solid #00eaff44}
h1{font-size:23px;margin-bottom:7px}.desc{font-size:12px;color:#9aabc4;line-height:1.5;margin-bottom:17px}
.btn{width:100%;padding:14px;border-radius:14px;font-size:13px;background:#182440;border:1px solid #ffffff12;margin-top:8px}
.play{background:linear-gradient(135deg,#00ddeb,#7544e8);margin:0 0 8px}
.stats{display:grid;grid-template-columns:repeat(3,1fr);gap:8px}.stat{padding:12px 5px;text-align:center;border-radius:15px}
.num{font-size:20px;color:#00eaff;font-weight:950}.lbl{font-size:9px;color:#9aabc4;font-weight:800}
.panel{padding:15px;border-radius:18px}.ach{display:flex;justify-content:space-between;background:#18213b;border-radius:10px;padding:10px;margin-top:8px;font-size:12px}
.hud{border-radius:15px;padding:10px;display:flex;align-items:center;justify-content:space-between;gap:7px}
.score{font-size:23px;color:#00eaff;font-weight:950;text-align:center}.sub{font-size:10px;color:#fbbf24;font-weight:900;text-align:center}
.board-wrap{padding:8px;border-radius:18px}
#board{width:min(100%,390px);aspect-ratio:1;margin:auto;display:grid;grid-template:repeat(10,minmax(0,1fr))/repeat(10,minmax(0,1fr));gap:3px;padding:5px;background:#070b19;border:2px solid #00eaff44;border-radius:12px;touch-action:none}
.cell{min-width:0;min-height:0;background:#17213b;border-radius:4px}
.c-blue{background:#00ddeb;box-shadow:inset 0 0 5px #fff8}.c-purple{background:#8b5cf6;box-shadow:inset 0 0 5px #fff8}.c-pink{background:#ec4899;box-shadow:inset 0 0 5px #fff8}.c-green{background:#10b981;box-shadow:inset 0 0 5px #fff8}.c-amber{background:#f59e0b;box-shadow:inset 0 0 5px #fff8}
.ghost-ok{background:#10b981aa!important;outline:1px solid #6ee7b7}.ghost-no{background:#ef4444aa!important;outline:1px solid #fca5a5}
.tray{height:98px;border-radius:16px;padding:9px;display:flex;gap:8px}
.slot{flex:1;min-width:0;border-radius:12px;background:#18213b;border:2px solid transparent;display:flex;align-items:center;justify-content:center;touch-action:none}
.slot.selected{border-color:#00eaff;background:#00eaff18}
.mini{--ms:clamp(10px,3.5vw,15px);display:grid;gap:2px;pointer-events:none}.mini-cell{width:var(--ms);height:var(--ms);border-radius:3px}
#floater{display:none;position:fixed;z-index:9999;pointer-events:none;transform:translate(-50%,-115%)}
#floater .mini{gap:3px}
.tools{display:grid;grid-template-columns:repeat(3,1fr);gap:7px}.tools .btn{margin:0;padding:12px 3px;font-size:11px}
#toast{display:none;position:fixed;z-index:10001;top:calc(17px + env(safe-area-inset-top,0px));left:50%;transform:translateX(-50%);background:#0d1326;border:1px solid #00eaff;color:#00eaff;padding:9px 16px;border-radius:22px;font-size:12px;font-weight:900;white-space:nowrap}
.modal{display:none;position:fixed;inset:0;z-index:5000;background:#03050fee;align-items:center;justify-content:center;padding:20px}.modal.show{display:flex}
.modal-box{width:100%;max-width:330px;padding:24px 20px;border-radius:22px;background:#0d1326;border:1px solid #00eaff;text-align:center;display:flex;flex-direction:column;gap:12px}
.btn,.icon{transition:transform .1s}.btn:active,.icon:active{transform:scale(.95)}
.cell{transition:background .15s}#board{box-shadow:0 0 22px #00eaff22}
.pop{animation:pop .45s ease-out}@keyframes pop{0%{background:#fff;transform:scale(1.35);box-shadow:0 0 14px #fff}100%{transform:scale(1)}}
.drop{animation:drop .22s ease-out}@keyframes drop{0%{transform:scale(.4)}60%{transform:scale(1.15)}100%{transform:scale(1)}}
.shake{animation:shake .35s}@keyframes shake{0%,100%{transform:translate(0)}25%{transform:translate(-4px,2px)}50%{transform:translate(4px,-2px)}75%{transform:translate(-3px,-1px)}}
.bump{animation:bump .3s}@keyframes bump{50%{transform:scale(1.3);color:#fbbf24}}
.diff{display:flex;gap:6px;margin-bottom:10px}.diff button{flex:1;padding:9px 4px;border-radius:12px;font-size:11px;background:#182440;border:1px solid #ffffff12}.diff button.on{background:linear-gradient(135deg,#00ddeb,#7544e8)}
.stats{grid-template-columns:repeat(4,1fr)}.top{display:flex;justify-content:space-between;background:#18213b;border-radius:10px;padding:9px 10px;margin-top:8px;font-size:12px}
body[data-theme="sunset"] :is(.shell,#floater){filter:hue-rotate(140deg)}body[data-theme="forest"] :is(.shell,#floater){filter:hue-rotate(-80deg)}
body[data-theme="sunset"]{background:radial-gradient(circle,#3b1a2e,#0f0510)}body[data-theme="forest"]{background:radial-gradient(circle,#123626,#030f08)}
body{overscroll-behavior:none;touch-action:manipulation}.shell{min-height:100dvh}
#board{width:max(220px,min(100%,390px,calc(100dvh - 400px)))}
body[data-theme="jewel"]::before,body[data-theme="wood"]::before{content:"";position:fixed;inset:0;z-index:-1;pointer-events:none;background:radial-gradient(ellipse 55% 14% at 12% 0,var(--l1),transparent 72%),radial-gradient(ellipse 55% 14% at 88% 0,var(--l2),transparent 72%),radial-gradient(ellipse 65% 12% at 18% 100%,var(--l2),transparent 72%),radial-gradient(ellipse 65% 12% at 82% 100%,var(--l1),transparent 72%)}
body[data-theme="jewel"]{--l1:#34a841;--l2:#1e7a2f;background:radial-gradient(circle,#2b1c40,#120a1f)}
body[data-theme="wood"]{--l1:#4caf50;--l2:#2e7d32;background:repeating-linear-gradient(90deg,#9a6a3a 0 38px,#8f6032 38px 40px),#8f6032}
body[data-theme="jewel"] :is(.header,.hud,.board-wrap,.tray,.panel,.stat){background:#2b1d3d;border:2px solid #b8893a;box-shadow:0 6px 18px #0007}
body[data-theme="jewel"] :is(.cell,.slot){background:#3d2c55}body[data-theme="jewel"] #board{background:#241636;border-color:#b8893a}
body[data-theme="jewel"] :is(.logo,.num,.score){color:#f7c948}body[data-theme="jewel"] .btn{background:#3d2c55;border-color:#b8893a}body[data-theme="jewel"] .btn.play{background:linear-gradient(#35b84a,#1b7a2c)}
body[data-theme="jewel"] :is(.c-blue,.c-purple,.c-pink,.c-green,.c-amber){border:2px solid #c9a15a;box-shadow:inset 0 0 6px #fffa}
body[data-theme="jewel"] .c-blue{background:linear-gradient(135deg,#7da0ff,#2a45c4)}body[data-theme="jewel"] .c-purple{background:linear-gradient(135deg,#c08cff,#6a2fc9)}body[data-theme="jewel"] .c-pink{background:linear-gradient(135deg,#ff8fc7,#d6247e)}body[data-theme="jewel"] .c-green{background:linear-gradient(135deg,#7be07b,#1e9a34)}body[data-theme="jewel"] .c-amber{background:linear-gradient(135deg,#ffc15a,#e06d12)}
body[data-theme="wood"] :is(.header,.hud,.board-wrap,.tray,.panel,.stat){background:#6b4423;border:2px solid #3d2412;box-shadow:inset 0 0 0 2px #8a5a2b,0 6px 14px #0006}
body[data-theme="wood"] :is(.cell,.slot){background:#4a2e17}body[data-theme="wood"] #board{background:#3a2210;border-color:#2a1808}
body[data-theme="wood"] :is(.logo,.num,.score,.pill){color:#ffe3a8}body[data-theme="wood"] .btn{background:#8a5a2b;border-color:#3d2412}body[data-theme="wood"] .btn.play{background:linear-gradient(#5db75d,#2f7a35)}
body[data-theme="wood"] :is(.c-blue,.c-purple,.c-pink,.c-green,.c-amber){box-shadow:inset 0 0 0 2px #b97a3e,inset 0 -3px 0 #a86a30}
body[data-theme="wood"] .c-blue{background:#efc48c}body[data-theme="wood"] .c-purple{background:#e0a96c}body[data-theme="wood"] .c-pink{background:#f5d3a1}body[data-theme="wood"] .c-green{background:#d49a5e}body[data-theme="wood"] .c-amber{background:#f7dca8}
button{font-family:inherit}.shell:has(#home.active)>.header{display:none}body:has(#home.active){background:radial-gradient(circle at 50% 18%,#4c1d95,#1e1b6b 45%,#0a0630)}
#home{position:relative}.topbar{display:flex;gap:6px;align-items:center}
.tb{height:40px;border-radius:20px;background:#12163f;border:2px solid #7c4dff88;display:flex;align-items:center;gap:5px;padding:0 6px 0 10px;font-weight:900;font-size:13px;flex:1;min-width:0}.tb .plus{margin-left:auto;width:24px;height:24px;border-radius:50%;background:#22c55e;font-size:16px;line-height:22px}
.sq{width:40px;height:40px;border-radius:12px;background:#12163f;border:2px solid #7c4dff88;font-size:18px;flex:none}
.logo2{text-align:center;padding:4px 0}.t1,.t2{font-size:clamp(46px,16vw,66px);font-weight:950;font-style:italic;line-height:.95;-webkit-text-stroke:2px #1b0a5c;-webkit-background-clip:text;background-clip:text;color:transparent;filter:drop-shadow(0 4px 0 #1b0a5c)}
.t1{background-image:linear-gradient(#fff27a,#ffb300)}.t2{background-image:linear-gradient(#7ff3ff,#1e88ff)}
.rib{display:inline-block;margin-top:6px;padding:3px 22px;background:linear-gradient(#8b5cf6,#5b2bd1);border:2px solid #c4b5fd;border-radius:6px;font-weight:950;font-style:italic;letter-spacing:3px;font-size:18px}.tag{font-size:12px;font-weight:900;color:#fbbf24;margin-top:8px}
.quick,.modes{display:grid;grid-template-columns:repeat(3,1fr);gap:8px}
.qk{position:relative;padding:10px 4px;border-radius:16px;background:linear-gradient(#2a1a6e,#161040);border:2px solid #a855f7aa;font-size:11px;line-height:1.2}.qk b{display:block;font-size:26px}.qk small{display:block;color:#fbbf24;font-size:10px;margin-top:2px}
.badge{position:absolute;top:-6px;right:-4px;width:18px;height:18px;border-radius:50%;background:#ef4444;font-size:11px;line-height:18px;font-style:normal}
.big{width:100%;padding:15px;border-radius:40px;font-size:22px;font-style:italic;font-weight:950;background:linear-gradient(#ffd54a,#ff8f00);border:3px solid #ffe08a;color:#2a0f6b;box-shadow:0 5px 0 #b45309,0 0 22px #ffb30088}
.md{padding:12px 3px;border-radius:16px;font-size:12px;line-height:1.2;border:2px solid #ffffff55}.md b{display:block;font-size:26px;margin-bottom:2px}.md small{display:block;font-size:10px;opacity:.9;margin-top:3px}
.m1{background:linear-gradient(#3b82f6,#1d4ed8)}.m2{background:linear-gradient(#fb923c,#ea580c)}.m3{background:linear-gradient(#4ade80,#16a34a)}
.ystats{display:grid;grid-template-columns:repeat(4,1fr);gap:6px;background:#12163f;border:2px solid #7c4dff66;border-radius:16px;padding:10px 4px;text-align:center}
.menu{display:grid;grid-template-columns:repeat(5,1fr);gap:6px}.menu button{padding:10px 2px;border-radius:14px;background:#12163f;border:2px solid #7c4dff66;font-size:10px;line-height:1.2}.menu span{display:block;font-size:22px}
.claim{display:flex;align-items:center;gap:10px;background:linear-gradient(90deg,#3b1a8a,#5b2bd1);border:2px solid #a855f7;border-radius:18px;padding:10px 12px;font-weight:900;font-size:14px}.claim button{margin-left:auto;padding:10px 18px;border-radius:20px;background:linear-gradient(#ffd54a,#ff9800);color:#2a0f6b}
.fl{position:absolute;width:28px;height:28px;border-radius:8px;opacity:.6;animation:fl 6s ease-in-out infinite;pointer-events:none}@keyframes fl{50%{transform:translateY(-14px) rotate(25deg)}}
.wwrap{position:relative;width:220px;margin:8px auto}.wwrap:before{content:"▼";position:absolute;top:-14px;left:50%;transform:translateX(-50%);color:#fff;font-size:26px;z-index:2}
.wheel{position:relative;width:220px;height:220px;border-radius:50%;border:6px solid #fbbf24;transition:transform 3.2s cubic-bezier(.12,.7,.1,1);background:conic-gradient(#3b82f6 0 45deg,#f59e0b 45deg 90deg,#10b981 90deg 135deg,#ec4899 135deg 180deg,#8b5cf6 180deg 225deg,#ef4444 225deg 270deg,#06b6d4 270deg 315deg,#eab308 315deg 360deg)}
.wl{position:absolute;left:50%;top:50%;width:0;height:0}.wl b{position:absolute;left:0;top:0;transform:translate(-50%,-84px);font-size:12px;text-shadow:0 1px 2px #000;white-space:nowrap}
.armed{outline:2px solid #fbbf24;box-shadow:0 0 12px #fbbf24}
.tools{grid-template-columns:repeat(5,1fr);gap:6px}.tools .btn{padding:8px 2px;font-size:20px;line-height:1.1}.tools small{display:block;font-size:10px;font-weight:800;color:#cbd5e1}.tray{height:88px}#game{gap:8px}
@media(max-height:720px){.header{padding:7px 12px}.hud{padding:6px 10px}.shell{gap:8px;padding:8px}}
.cell{background:#141d38;box-shadow:inset 0 2px 4px #000a,inset 0 -1px 0 #ffffff0d}
.c-blue{background:radial-gradient(circle at 30% 22%,#fffa 0,#fff0 42%),linear-gradient(145deg,#6ff3ff,#00c2e0 50%,#0086b3);box-shadow:inset 0 2px 0 #ffffffaa,inset 0 -3px 0 #00000040,inset 0 0 0 1px #ffffff55,0 0 9px #00ddeb77}
.c-purple{background:radial-gradient(circle at 30% 22%,#fffa 0,#fff0 42%),linear-gradient(145deg,#c9a8ff,#8b5cf6 50%,#5a2fc2);box-shadow:inset 0 2px 0 #ffffffaa,inset 0 -3px 0 #00000040,inset 0 0 0 1px #ffffff55,0 0 9px #8b5cf677}
.c-pink{background:radial-gradient(circle at 30% 22%,#fffa 0,#fff0 42%),linear-gradient(145deg,#ff9fd2,#ec4899 50%,#b0206c);box-shadow:inset 0 2px 0 #ffffffaa,inset 0 -3px 0 #00000040,inset 0 0 0 1px #ffffff55,0 0 9px #ec489977}
.c-green{background:radial-gradient(circle at 30% 22%,#fffa 0,#fff0 42%),linear-gradient(145deg,#74f0bd,#10b981 50%,#047652);box-shadow:inset 0 2px 0 #ffffffaa,inset 0 -3px 0 #00000040,inset 0 0 0 1px #ffffff55,0 0 9px #10b98177}
.c-amber{background:radial-gradient(circle at 30% 22%,#fffa 0,#fff0 42%),linear-gradient(145deg,#fde68a,#f59e0b 50%,#c06a08);box-shadow:inset 0 2px 0 #ffffffaa,inset 0 -3px 0 #00000040,inset 0 0 0 1px #ffffff55,0 0 9px #f59e0b77}
.board-wrap{background:linear-gradient(145deg,#161f40,#0b1128)}#board{background:linear-gradient(#0a0f24,#060917);border:2px solid #00eaff55;box-shadow:0 0 24px #00eaff33,inset 0 0 18px #000a}
.shell{padding:8px}.board-wrap{padding:4px}#board{width:max(240px,min(100%,calc(100dvh - 375px)))}
.shell:has(#game.active)>.header{padding:4px 10px}.shell:has(#game.active) .icon{width:30px;height:30px;font-size:13px}.shell:has(#game.active) .pill{padding:4px 10px}.tray{height:80px}#board{width:max(240px,min(100%,calc(100dvh - 340px)))}
.board-wrap{padding:6px;border:3px solid transparent;border-radius:22px;background:linear-gradient(#0b1128,#0b1128) padding-box,linear-gradient(135deg,#00eaff,#8b5cf6,#ec4899,#fbbf24) border-box;animation:bglow 4s ease-in-out infinite}
@keyframes bglow{0%,100%{box-shadow:0 0 14px #00eaff55,0 6px 18px #0008}50%{box-shadow:0 0 30px #ec489977,0 6px 18px #0008}}
#board{background:radial-gradient(circle at 50% 35%,#18235a,#060917 80%);border:2px solid #ffffff18;border-radius:16px;box-shadow:inset 0 0 22px #000b}
.cell:not([class*="c-"]){background:#ffffff0e;box-shadow:inset 0 1px 3px #000a,inset 0 0 0 1px #ffffff0a}
.fl{display:none}#home.active{min-height:calc(100dvh - 16px);justify-content:space-between}
.c-blue{background:linear-gradient(160deg,#6aa5e6,#3f78bd);box-shadow:inset 0 1px 0 #ffffff33,inset 0 -2px 0 #00000033}
.c-purple{background:linear-gradient(160deg,#9d8be0,#6c56b8);box-shadow:inset 0 1px 0 #ffffff33,inset 0 -2px 0 #00000033}
.c-pink{background:linear-gradient(160deg,#e283ad,#b9567f);box-shadow:inset 0 1px 0 #ffffff33,inset 0 -2px 0 #00000033}
.c-green{background:linear-gradient(160deg,#62c29b,#3a9372);box-shadow:inset 0 1px 0 #ffffff33,inset 0 -2px 0 #00000033}
.c-amber{background:linear-gradient(160deg,#e8b25c,#c0832f);box-shadow:inset 0 1px 0 #ffffff33,inset 0 -2px 0 #00000033}
.board-wrap{animation:none;background:linear-gradient(#101830,#101830) padding-box,linear-gradient(135deg,#4b6a9b,#6a5a9f) border-box;box-shadow:0 4px 14px #0006}#board{background:#0c1226;box-shadow:inset 0 0 14px #000a}
@keyframes pop{0%{background:#ffffff55;transform:scale(1.12)}100%{transform:scale(1)}}.shake{animation:none}@keyframes bump{50%{transform:scale(1.1)}}
.c-blue{background:#4f73d9;box-shadow:inset 0 3px 0 #ffffff55,inset 0 -3px 0 #00000045}.c-purple{background:#b73bbb;box-shadow:inset 0 3px 0 #ffffff55,inset 0 -3px 0 #00000045}.c-pink{background:#d0443f;box-shadow:inset 0 3px 0 #ffffff55,inset 0 -3px 0 #00000045}.c-green{background:#33a037;box-shadow:inset 0 3px 0 #ffffff55,inset 0 -3px 0 #00000045}.c-amber{background:#e6b23a;box-shadow:inset 0 3px 0 #ffffff55,inset 0 -3px 0 #00000045}
#game.active{min-height:calc(100dvh - 76px);justify-content:space-between}
@media(min-height:800px){.tray{height:104px}.tools .btn{padding:12px 2px}}
.cell{border-radius:8px}.mini-cell{border-radius:5px}
.c-blue{background:linear-gradient(145deg,#5ab0e6,#2f7bb5);border:1px solid #ffffff30;box-shadow:inset 0 2px 2px #ffffff30,inset 0 -2px 3px #00000030}
.c-purple{background:linear-gradient(145deg,#a98be6,#7a55c4);border:1px solid #ffffff30;box-shadow:inset 0 2px 2px #ffffff30,inset 0 -2px 3px #00000030}
.c-pink{background:linear-gradient(145deg,#ec7fae,#c24f82);border:1px solid #ffffff30;box-shadow:inset 0 2px 2px #ffffff30,inset 0 -2px 3px #00000030}
.c-green{background:linear-gradient(145deg,#52c49a,#2f9672);border:1px solid #ffffff30;box-shadow:inset 0 2px 2px #ffffff30,inset 0 -2px 3px #00000030}
.c-amber{background:linear-gradient(145deg,#eebb55,#cc8a28);border:1px solid #ffffff30;box-shadow:inset 0 2px 2px #ffffff30,inset 0 -2px 3px #00000030}
@keyframes drop{0%{transform:scale(.85);opacity:.6}100%{transform:scale(1);opacity:1}}.drop{animation:drop .18s ease-out}
.cell{border-radius:9px}.mini-cell{border-radius:6px}
.c-blue,.c-purple,.c-pink,.c-green,.c-amber,.c-red{border:1px solid #ffffff40;box-shadow:inset 0 3px 3px #ffffff66,inset 0 -3px 4px #00000038,0 2px 5px #00000040}
.c-blue{background:linear-gradient(160deg,#4ec3ff,#1f7fe0)}.c-purple{background:linear-gradient(160deg,#b27cff,#7b3fe4)}.c-pink{background:linear-gradient(160deg,#ff6fd8,#d61fb0)}.c-green{background:linear-gradient(160deg,#5ee060,#1fae27)}.c-amber{background:linear-gradient(160deg,#ffd84d,#f0a512)}.c-red{background:linear-gradient(160deg,#ff6b5e,#d62d2d)}
body[data-theme="jewel"] .c-red{background:linear-gradient(135deg,#ff9a8a,#d62e2e);border:2px solid #c9a15a;box-shadow:inset 0 0 6px #fffa}body[data-theme="wood"] .c-red{background:#e9a77a;border:0;box-shadow:inset 0 0 0 2px #b97a3e,inset 0 -3px 0 #a86a30}
.board-wrap{border:2px solid transparent;background:linear-gradient(#101830,#101830) padding-box,linear-gradient(135deg,#34456e,#473f78) border-box;box-shadow:0 3px 10px #0005}#board{border:1px solid #ffffff0d}
.shell:has(#game.active)>.header{display:none}.shell:has(#game.active){padding:6px 4px}.board-wrap{padding:3px}#board{width:max(240px,min(100%,calc(100dvh - 310px)));gap:2px;padding:3px}
.cell,.mini-cell{border-radius:27%}.tray{height:116px}.mini{--ms:clamp(14px,4.2vw,18px);gap:3px}
.cell[class*="c-"],.mini-cell[class*="c-"]{position:relative}
.cell[class*="c-"]::after,.mini-cell[class*="c-"]::after{content:"";position:absolute;left:13%;right:13%;top:7%;height:36%;border-radius:50% 50% 60% 60%/75% 75% 40% 40%;background:linear-gradient(#ffffff88,#ffffff12);pointer-events:none}
body[data-theme="wood"] :is(.cell,.mini-cell)::after{display:none}
.c-blue{--g1:#7fb2ff;--g2:#2c4fd0}.c-purple{--g1:#c79bff;--g2:#6b2fcf}.c-pink{--g1:#ff8fc4;--g2:#d0237a}.c-green{--g1:#7fe48a;--g2:#1f9a3a}.c-amber{--g1:#ffc861;--g2:#e07a12}.c-red{--g1:#ff8a7a;--g2:#cf2a2a}
body:not([data-theme="wood"]) :is(.cell,.mini-cell)[class*="c-"]{position:relative;border:0;border-radius:24%;background:linear-gradient(145deg,#f0d29a,#a9763a);box-shadow:inset 0 1px 1px #ffffffaa,inset 0 -2px 3px #00000055,0 2px 4px #0006}
body:not([data-theme="wood"]) :is(.cell,.mini-cell)[class*="c-"]::after{content:"";position:absolute;inset:15%;height:auto;border-radius:22%;background:linear-gradient(135deg,transparent 0 28%,#ffffff66 28% 40%,transparent 40% 100%),linear-gradient(145deg,var(--g1),var(--g2));box-shadow:inset 0 0 0 1.5px #ffffff4d,inset 0 -3px 4px #00000050}
#floater{left:0;top:0;will-change:transform}#floater .mini{gap:2px}
.cell{border-radius:6px}.mini-cell{border-radius:5px}
.c-blue{--g0:#bae6fd;--g1:#0284c7;--g2:#0c4a6e}.c-purple{--g0:#ddd6fe;--g1:#7c3aed;--g2:#4c1d95}.c-pink{--g0:#fbcfe8;--g1:#db2777;--g2:#831843}.c-green{--g0:#a7f3d0;--g1:#059669;--g2:#064e3b}.c-amber{--g0:#fde68a;--g1:#d97706;--g2:#78350f}.c-red{--g0:#fecdd3;--g1:#e11d48;--g2:#881337}
body:not([data-theme="wood"]) :is(.cell,.mini-cell)[class*="c-"]{border:1px solid #ffffff85;border-radius:5px;background:radial-gradient(circle at 26% 24%,#fff 0,var(--g0) 26%,var(--g1) 68%,var(--g2) 100%);box-shadow:inset 0 2px 3px #ffffffd9,inset 0 -3px 5px #0000007a,0 2px 6px #00000060}
body:not([data-theme="wood"]) :is(.cell,.mini-cell)[class*="c-"]::after{inset:19%;border-radius:3px;background:linear-gradient(135deg,#ffffffa6,#ffffff1a 52%,#ffffff61);border:1px solid #ffffff99;box-shadow:inset 0 1px 2px #ffffffe6,0 1px 2px #00000040}
body:not([data-theme="wood"]) :is(.cell,.mini-cell)[class*="c-"]::after{display:none}
.tray{height:124px}.mini{--ms:clamp(15px,5vw,21px)}
.spk{position:fixed;width:7px;height:7px;border-radius:2px;pointer-events:none;z-index:8000;animation:spk .65s ease-out forwards}@keyframes spk{to{transform:translate(var(--dx),var(--dy)) rotate(180deg) scale(.2);opacity:0}}
.ptxt{position:fixed;transform:translate(-50%,-50%);z-index:8100;pointer-events:none;text-align:center;font-weight:950;font-size:28px;font-style:italic;color:#ffe08a;text-shadow:0 2px 0 #7c3a00,0 4px 14px #0009;animation:ptx 1s ease-out forwards}.ptxt small{display:block;font-size:16px;color:#fff}@keyframes ptx{0%{opacity:0;transform:translate(-50%,-30%) scale(.7)}20%{opacity:1;transform:translate(-50%,-50%) scale(1.05)}100%{opacity:0;transform:translate(-50%,-120%) scale(1)}}
#floater{filter:drop-shadow(0 8px 10px #0007)}.board-wrap.cg{box-shadow:0 0 18px #fbbf2455}
.big{position:relative;overflow:hidden}.big::after{content:"";position:absolute;top:0;left:-60%;width:40%;height:100%;background:linear-gradient(100deg,transparent,#ffffff44,transparent);transform:skewX(-20deg);animation:shine 4s ease-in-out infinite}@keyframes shine{0%,60%{left:-60%}100%{left:140%}}
.logo2{animation:lf 4s ease-in-out infinite}@keyframes lf{50%{transform:translateY(-4px)}}.badge{animation:bp 1.4s ease-in-out infinite}@keyframes bp{50%{transform:scale(1.15)}}
@media(max-width:360px){.shell{padding:8px}.hud{padding:7px}.logo{font-size:12px}.tools{gap:4px}}
</style></head><body>
<div id="toast"></div><div id="floater"></div>
<main class="shell">
<header class="header"><div class="logo">🧩 BLOCK PUZZLE ELITE</div><div class="right"><div class="pill">🪙 <span id="coins">100</span></div><button class="icon" onclick="openThemes()">🎨</button><button class="icon" id="soundBtn" onclick="toggleSound()">🔊</button></div></header>
<section id="home" class="screen active">
<i class="fl" style="left:2%;top:14%;background:#3b82f6"></i><i class="fl" style="right:3%;top:20%;background:#22c55e;animation-delay:-2s"></i><i class="fl" style="left:6%;top:56%;background:#f59e0b;animation-delay:-4s"></i>
<div class="topbar"><button class="sq" onclick="openSettings()">⚙️</button><div class="tb">🪙 <span id="coins2">100</span><button class="plus" onclick="pickTheme('__coins')">+</button></div><div class="tb">💎 <span id="gems">5</span><button class="plus" onclick="openShop()">+</button></div><button class="sq" onclick="openLB()">🏆</button><button class="sq" onclick="openThemes()">🎨</button></div>
<div class="logo2"><div class="t1">BLOCK</div><div class="t2">PUZZLE</div><div class="rib">ULTIMATE</div><div class="tag">Drag • Drop • Clear • Win</div></div>
<div class="quick"><button class="qk" onclick="claimReward()"><i class="badge" id="rwBadge">!</i><b>🎁</b>Daily Reward<small id="rwTime">--</small></button><button class="qk" onclick="pickTheme('__coins')"><i class="badge">!</i><b>🧰</b>Free Coins<small>+100 🪙</small></button><button class="qk" onclick="openSpin()"><b>🎡</b>Spin Wheel<small>Win prizes</small></button></div>
<button class="big" onclick="startGame('classic')">▶ PLAY NOW</button>
<div class="modes"><button class="md m1" onclick="startGame('classic')"><b>♾️</b>Classic<small>Endless play</small></button><button class="md m2" onclick="startGame('time')"><b>⏱️</b>Time Attack<small>60s Rush</small></button><button class="md m3" onclick="startGame('daily')"><b>📅</b>Daily Goal<small>500 Pts</small></button></div>
<div class="ystats"><div><div class="num" id="best2">0</div><div class="lbl">BEST</div></div><div><div class="num" id="played2">0</div><div class="lbl">GAMES</div></div><div><div class="num" id="ach2">0/10</div><div class="lbl">ACHIEVED</div></div><div><div class="num" id="streak2">0</div><div class="lbl">🔥 STREAK</div></div></div>
<div class="menu"><button onclick="openAch()"><span>🏆</span>Achieve</button><button onclick="openShop()"><span>🛒</span>Shop</button><button onclick="openThemes()"><span>🎨</span>Themes</button><button onclick="openLB()"><span>📊</span>Leaders</button><button onclick="openSettings()"><span>⚙️</span>Settings</button></div>

<div id="oldHome" hidden>
<div class="hero"><h1>Ultimate 10×10 Grid</h1><p class="desc">Drag pieces onto the board, or tap a piece then a board cell. Clear lines and build combos!</p>
<div class="diff" id="diffRow"><button onclick="setDiff(0)">😌 Easy</button><button onclick="setDiff(1)">🙂 Normal</button><button onclick="setDiff(2)">🔥 Hard</button></div>
<button class="btn play" onclick="startGame('classic')">▶ CLASSIC ENDLESS</button>
<button class="btn" onclick="startGame('daily')">📅 DAILY CHALLENGE (500 Pts)</button>
<button class="btn" onclick="startGame('time')">⏱️ TIME ATTACK (60s)</button></div>
<div class="stats"><div class="stat"><div class="num" id="best">0</div><div class="lbl">BEST SCORE</div></div><div class="stat"><div class="num" id="played">0</div><div class="lbl">PLAYED</div></div><div class="stat"><div class="num" id="achCount">0/4</div><div class="lbl">ACHIEVED</div></div><div class="stat"><div class="num" id="streak">0</div><div class="lbl">🔥 STREAK</div></div></div>
<div class="panel"><b>🏅 Top Scores</b><div id="topList"></div></div>
<div class="panel"><b>🏆 Achievements</b><div id="achList"></div></div></div>
</section>
<section id="game" class="screen">
<div class="hud"><button class="btn" style="width:auto;margin:0;padding:7px 10px" onclick="pauseGame()">⏸ Pause</button><div><div class="score" id="score">0</div><div class="sub" id="modeText">CLASSIC</div></div><div class="sub" id="combo">1x COMBO</div></div>
<div class="board-wrap"><div id="board"></div></div><div class="tray" id="tray"></div>
<div class="tools"><button class="btn" onclick="rotatePiece()">🔄<small>Rotate</small></button><button class="btn" onclick="undoMove()">↩️<small>Undo</small></button><button class="btn" onclick="shuffleTray()">🔀<small>20🪙</small></button><button class="btn" id="hamBtn" onclick="armPower('hammer')">🔨<small>30🪙</small></button><button class="btn" id="bombBtn" onclick="armPower('bomb')">💣<small>60🪙</small></button></div>
</section></main>
<div class="modal" id="infoModal"><div class="modal-box"><h2 id="infoTitle" style="color:#00eaff"></h2><div id="infoBody" style="display:flex;flex-direction:column;gap:8px;max-height:60vh;overflow:auto"></div><button class="btn" style="margin:0" onclick="closeInfo()">✕ Close</button></div></div>
<div class="modal" id="themeModal"><div class="modal-box"><h2 style="color:#00eaff">🎨 Themes</h2><div id="themeList" style="display:flex;flex-direction:column;gap:8px"></div><button class="btn" style="margin:0" onclick="closeThemes()">✕ Close</button></div></div>
<div class="modal" id="adModal"><div class="modal-box"><h2 style="color:#00eaff">📺 Watch Ad</h2><div id="adText" style="font-size:22px;font-weight:950">Ad ends in 5s</div><p style="font-size:11px;color:#9aabc4">Demo placeholder ad. A real ad network can be plugged in here.</p><button class="btn play" id="adBtn" style="margin:0" onclick="claimAd()" disabled>🎁 Claim reward</button><button class="btn" style="margin:0" onclick="closeAd()">✕ Cancel</button></div></div>
<div class="modal" id="modal"><div class="modal-box"><h2 id="resultTitle" style="color:#00eaff">GAME OVER</h2><div id="resultScore" style="font-size:35px;font-weight:950">0 Pts</div><p id="resultMsg" style="font-size:12px;color:#9aabc4"></p><button class="btn play" style="margin:0" onclick="startGame(mode)">PLAY AGAIN</button><button class="btn" style="margin:0" onclick="goHome()">MAIN MENU</button></div></div>
<script>
"use strict";
const KEY="block_puzzle_elite_fixed_v1";
const defaults={coins:100,best:0,played:0,sound:true,top:[],streak:0,lastDaily:"",diff:1,theme:"neon",unlocked:["neon","sunset","forest"],gems:5,lines:0,lastReward:"",lastSpin:"",ach:{first:false,s100:false,s500:false,daily:false}};
function loadSave(){try{const x=JSON.parse(localStorage.getItem(KEY)||"null");if(!x)return JSON.parse(JSON.stringify(defaults));return{...defaults,coins:Number.isFinite(x.coins)?Math.max(0,x.coins):100,best:Number.isFinite(x.best)?Math.max(0,x.best):0,played:Number.isFinite(x.played)?Math.max(0,x.played):0,sound:typeof x.sound==="boolean"?x.sound:true,top:Array.isArray(x.top)?x.top.slice(0,5):[],streak:Number.isFinite(x.streak)?x.streak:0,lastDaily:typeof x.lastDaily==="string"?x.lastDaily:"",diff:[0,1,2].includes(x.diff)?x.diff:1,theme:["neon","sunset","forest","jewel","wood"].includes(x.theme)?x.theme:"neon",unlocked:Array.isArray(x.unlocked)?[...new Set([...defaults.unlocked,...x.unlocked])]:defaults.unlocked.slice(),gems:Number.isFinite(x.gems)?Math.max(0,x.gems):5,lines:Number.isFinite(x.lines)?x.lines:0,lastReward:typeof x.lastReward==="string"?x.lastReward:"",lastSpin:typeof x.lastSpin==="string"?x.lastSpin:"",ach:{...defaults.ach,...(x.ach||{})}}}catch(e){return JSON.parse(JSON.stringify(defaults))}}
let data=loadSave(),mode="classic",grid=[],tray=[],selected=-1,score=0,combo=1,backup=null,timer=null,gameOver=true,seconds=60,dragIndex=null,dragId=null,gameOverDelay=null,audio=null,floatCell=23,fx={pop:new Set(),drop:new Set()};document.body.dataset.theme=data.theme;
const SHAPES=[
[[1]],[[1,1]],[[1],[1]],[[1,1],[1,1]],[[1,1,1]],[[1],[1],[1]],[[1,1,1,1]],[[1,1,1,1,1]],[[1,1],[0,1]],[[1,0],[1,1]],[[1,1,1],[0,1,0]],[[1,0,0],[1,1,1]],[[1,1,1],[1,1,1],[1,1,1]],[[1,1,1],[1,1,1]],[[1,1],[1,1],[1,1]],[[1,0,0],[1,0,0],[1,1,1]],[[0,1,1],[1,1,0]],[[1,1,0],[0,1,1]],[[1,1],[1,0]],[[0,1],[1,1]],[[1],[1],[1],[1],[1]],[[1,1],[1,0],[1,0]]
],COLORS=["c-blue","c-purple","c-pink","c-green","c-amber","c-red"];
function save(){try{localStorage.setItem(KEY,JSON.stringify(data))}catch(e){}homeUI()}
function homeUI(){$("coins").textContent=$("coins2").textContent=data.coins;$("best").textContent=data.best;$("played").textContent=data.played;$("soundBtn").textContent=data.sound?"🔊":"🔇";let defs=[["first","🎮 First Match","Complete 1 game"],["s100","⭐ 100 Club","Score 100+ points"],["s500","👑 Master","Score 500+ points"],["daily","📅 Daily Hero","Win Daily Challenge"],["s1000","💎 Legend","Score 1000+ points"],["play10","🎯 Regular","Play 10 games"],["combo3","🔥 Combo King","Reach a 3x combo"],["lines50","🧹 Line Cleaner","Clear 50 lines in total"],["spin","🎡 Lucky Spinner","Use the spin wheel"],["theme","🎨 Stylist","Unlock a theme"]],n=0;$("achList").innerHTML=defs.map(([k,t,d])=>{let ok=!!data.ach[k];if(ok)n++;return `<div class="ach"><span><b>${t}</b><br><small style="color:#9aabc4">${d}</small></span><b style="color:${ok?"#10b981":"#64748b"}">${ok?"UNLOCKED ✓":"LOCKED"}</b></div>`}).join("");$("achCount").textContent=n+"/10";let yy=new Date();yy.setDate(yy.getDate()-1);$("streak").textContent=(data.lastDaily===today()||data.lastDaily===today(yy))?data.streak:0;document.querySelectorAll("#diffRow button").forEach((b,i)=>b.classList.toggle("on",i===data.diff));$("topList").innerHTML=data.top.length?data.top.map((t,i)=>`<div class="top"><span>${i+1}. ${t.m.toUpperCase()}</span><b>${t.s} Pts · ${t.d}</b></div>`).join(""):'<div class="top"><span>No scores yet. Play a game!</span></div>';homeUI2()}
function $(id){return document.getElementById(id)}
function toast(s){let e=$("toast");e.textContent=s;e.style.display="block";clearTimeout(e._t);e._t=setTimeout(()=>e.style.display="none",1600)}
function sound(f=440,type="sine",dur=.08){if(!data.sound)return;try{navigator.vibrate&&navigator.vibrate(f>=800?[30,30,30]:12)}catch(e){}try{let C=window.AudioContext||window.webkitAudioContext;if(!C)return;if(!audio)audio=new C();if(audio.state==="suspended")audio.resume();let o=audio.createOscillator(),g=audio.createGain();o.type=type;o.frequency.value=f;g.gain.setValueAtTime(.07,audio.currentTime);g.gain.exponentialRampToValueAtTime(.001,audio.currentTime+dur);o.connect(g);g.connect(audio.destination);o.start();o.stop(audio.currentTime+dur)}catch(e){}}
function toggleSound(){data.sound=!data.sound;save();toast(data.sound?"Sound enabled 🔊":"Sound muted 🔇")}
function clearTimers(){if(timer){clearInterval(timer);timer=null}if(gameOverDelay){clearTimeout(gameOverDelay);gameOverDelay=null}}
function startGame(m){clearTimers();cancelDrag();paused=false;revived=false;reviveOpen=false;powerMode=null;$("infoModal").classList.remove("show");updPower();rng=m==="daily"?seedRng():Math.random;setTimeout(tutor,300);mode=m;grid=Array.from({length:10},()=>Array(10).fill(""));score=0;combo=1;selected=-1;backup=null;gameOver=false;seconds=60;$("modal").classList.remove("show");$("home").classList.remove("active");$("game").classList.add("active");if(m==="daily")for(let i=3;i<7;i++){grid[i][3]="c-purple";grid[3][i]="c-amber"}newTray();renderBoard();renderTray();hud();if(m==="time")timer=setInterval(()=>{if(gameOver||paused)return;seconds=Math.max(0,seconds-1);hud();if(seconds===0)finish(false,"Time expired!")},1000);checkMoves()}
function goHome(){clearTimers();cancelDrag();gameOver=true;$("modal").classList.remove("show");$("game").classList.remove("active");$("home").classList.add("active");homeUI()}
function hud(){tweenScore();document.querySelector(".board-wrap").classList.toggle("cg",combo>1);$("combo").innerHTML=combo+"x COMBO<br>🪙 "+data.coins;$("modeText").textContent=mode==="classic"?"CLASSIC MODE":mode==="daily"?`DAILY TARGET: ${Math.min(score,500)}/500`:`TIME LEFT: ${seconds}s`}
function pickShape(){let w=SHAPES.map(s=>{let n=s.flat().filter(Boolean).length;return mode==="daily"||data.diff===1?1:data.diff===0?1/n:n}),t=w.reduce((a,b)=>a+b),r=rng()*t;for(let i=0;i<w.length;i++){r-=w[i];if(r<=0)return SHAPES[i]}return SHAPES[0]}
function newPiece(){let m=pickShape();return{m:m.map(r=>r.slice()),c:COLORS[Math.floor(rng()*COLORS.length)]}}
function newTray(){for(let k=0;k<30;k++){tray=[newPiece(),newPiece(),newPiece()];if(tray.some(p=>canPlace(p.m)))break}}
function renderBoard(){let b=$("board");b.innerHTML="";for(let r=0;r<10;r++)for(let c=0;c<10;c++){let e=document.createElement("div");e.className="cell "+(grid[r][c]||"")+(fx.pop.has(r+","+c)?" pop":"")+(fx.drop.has(r+","+c)?" drop":"");e.dataset.r=r;e.dataset.c=c;e.onclick=()=>{if(gameOver)return;if(powerMode){usePower(r,c);return}if(selected!==-1)place(selected,r,c)};b.appendChild(e)}fx.pop.clear();fx.drop.clear()}
function buildMini(p){let m=document.createElement("div");m.className="mini";m.style.gridTemplateColumns=`repeat(${p.m[0].length},var(--ms))`;p.m.forEach(row=>row.forEach(v=>{let e=document.createElement("div");e.className="mini-cell "+(v?p.c:"");if(!v)e.style.visibility="hidden";m.appendChild(e)}));return m}
function renderTray(){let t=$("tray");t.innerHTML="";tray.forEach((p,i)=>{let s=document.createElement("div");s.className="slot"+(selected===i?" selected":"");if(p){s.appendChild(buildMini(p));s.onclick=()=>{if(gameOver||dragIndex!==null)return;selected=i;sound(550);renderTray()};s.onpointerdown=e=>beginDrag(e,i)}t.appendChild(s)})}
function beginDrag(e,i){if(gameOver||!tray[i]||e.button===2)return;e.preventDefault();cancelDrag();dragIndex=i;dragId=e.pointerId;selected=i;let p=tray[i],f=$("floater"),cs=$("board").firstChild.getBoundingClientRect().width;floatCell=cs;f.innerHTML="";let m=buildMini(p);m.style.setProperty("--ms",cs+"px");f.appendChild(m);f.style.display="block";moveFloat(e.clientX,e.clientY);window.addEventListener("pointermove",dragMove,{passive:false});window.addEventListener("pointerup",dragEnd);window.addEventListener("pointercancel",dragCancel);document.querySelectorAll("#tray .slot").forEach((s,k)=>s.classList.toggle("selected",k===i))}
function moveFloat(x,y){$("floater").style.left=x+"px";$("floater").style.top=y+"px"}
function targetAt(x,y){let el=document.elementFromPoint(x,y),cell=el&&el.closest?el.closest(".cell"):null;if(!cell||!$("board").contains(cell))return null;return{r:+cell.dataset.r,c:+cell.dataset.c}}
function anchorCell(x,y){moveFloat(x,y);let r=$("floater").getBoundingClientRect();return targetAt(r.left+floatCell/2,r.top+floatCell/2)}
function clearGhost(){document.querySelectorAll(".cell.ghost-ok,.cell.ghost-no").forEach(e=>e.classList.remove("ghost-ok","ghost-no"))}
function fits(m,r,c){for(let y=0;y<m.length;y++)for(let x=0;x<m[y].length;x++)if(m[y][x]&&(r+y<0||c+x<0||r+y>=10||c+x>=10||grid[r+y][c+x]!==""))return false;return true}
function ghost(p,r,c){let ok=fits(p.m,r,c);p.m.forEach((row,y)=>row.forEach((v,x)=>{if(!v)return;let e=document.querySelector(`.cell[data-r="${r+y}"][data-c="${c+x}"]`);if(e)e.classList.add(ok?"ghost-ok":"ghost-no")}))}
function dragMove(e){if(dragIndex===null||e.pointerId!==dragId)return;e.preventDefault();clearGhost();let pos=anchorCell(e.clientX,e.clientY);if(pos&&tray[dragIndex])ghost(tray[dragIndex],pos.r,pos.c)}
function removeDragEvents(){window.removeEventListener("pointermove",dragMove);window.removeEventListener("pointerup",dragEnd);window.removeEventListener("pointercancel",dragCancel)}
function dragEnd(e){if(dragIndex===null||(dragId!==null&&e.pointerId!==dragId))return;let i=dragIndex,pos=anchorCell(e.clientX,e.clientY);removeDragEvents();$("floater").style.display="none";clearGhost();dragIndex=null;dragId=null;if(pos&&!gameOver)place(i,pos.r,pos.c)}
function dragCancel(e){if(dragIndex===null||(dragId!==null&&e.pointerId!==dragId))return;cancelDrag()}
function cancelDrag(){removeDragEvents();dragIndex=null;dragId=null;if($("floater"))$("floater").style.display="none";clearGhost()}
function place(i,r,c){if(gameOver||!tray[i])return;let p=tray[i];if(!fits(p.m,r,c)){sound(150,"sawtooth",.1);toast("❌ Cannot place block here!");return}backup={grid:grid.map(row=>row.slice()),tray:tray.map(x=>x?{m:x.m.map(row=>row.slice()),c:x.c}:null),score,combo};p.m.forEach((row,y)=>row.forEach((v,x)=>{if(v){grid[r+y][c+x]=p.c;fx.drop.add((r+y)+","+(c+x))}}));score+=p.m.flat().filter(Boolean).length*5;tray[i]=null;selected=-1;sound(520);clearLines();if(mode==="daily"&&score>=500){renderBoard();renderTray();hud();finish(true,"Daily Challenge completed!");return}if(tray.every(x=>x===null))newTray();renderBoard();renderTray();hud();checkMoves()}
function clearLines(){let rows=[],cols=[];for(let r=0;r<10;r++)if(grid[r].every(Boolean))rows.push(r);for(let c=0;c<10;c++)if(grid.every(row=>row[c]))cols.push(c);let n=rows.length+cols.length;if(!n){combo=1;return}rows.forEach(r=>{for(let c=0;c<10;c++)fx.pop.add(r+","+c)});cols.forEach(c=>{for(let r=0;r<10;r++)fx.pop.add(r+","+c)});fx.pop.forEach(k=>fx.drop.delete(k));sparkle(fx.pop);rows.forEach(r=>grid[r].fill(""));cols.forEach(c=>{for(let r=0;r<10;r++)grid[r][c]=""});combo=n>1?combo+1:1;data.lines+=n;if(combo>=3)data.ach.combo3=true;if(data.lines>=50)data.ach.lines50=true;if(mode==="time")seconds=Math.min(99,seconds+3*n);let base=n===1?100:n===2?250:n===3?400:550,gain=base*combo;score+=gain;sound(880,"triangle",.18);if(combo>1||n>1){let w=$("board");w.classList.remove("shake");void w.offsetWidth;w.classList.add("shake")}bumpScore();popText(n>=4?"PERFECT!":n===3?"AMAZING!":n===2?"GREAT!":combo>1?"COMBO x"+combo:"NICE!","+"+gain)}
function rotM(m){let R=m.length,C=m[0].length,out=Array.from({length:C},()=>Array(R).fill(0));for(let r=0;r<R;r++)for(let c=0;c<C;c++)out[c][R-1-r]=m[r][c];return out}
function rotatePiece(){if(gameOver)return;if(selected===-1||!tray[selected]){toast("⚠️ Select a piece first!");return}tray[selected].m=rotM(tray[selected].m);sound(650);renderTray()}
function undoMove(){if(gameOver)return;if(!backup){toast("⚠️ No move to undo!");return}grid=backup.grid.map(r=>r.slice());tray=backup.tray.map(x=>x?{m:x.m.map(r=>r.slice()),c:x.c}:null);score=backup.score;combo=backup.combo;selected=-1;backup=null;renderBoard();renderTray();hud();toast("↩️ Move undone!")}
function shuffleTray(){if(gameOver)return;if(data.coins<20){toast("⚠️ Need 20 coins!");return}data.coins-=20;newTray();selected=-1;backup=null;save();hud();renderTray();sound(720);toast("🔀 Tray shuffled!");checkMoves()}
function canPlace(m){for(let k=0;k<4;k++){for(let r=0;r<10;r++)for(let c=0;c<10;c++)if(fits(m,r,c))return true;m=rotM(m)}return false}
function checkMoves(){if(gameOver)return;let possible=tray.filter(Boolean).some(p=>canPlace(p.m));if(!possible){clearTimeout(gameOverDelay);gameOverDelay=setTimeout(()=>{gameOverDelay=null;if(!gameOver)offerRevive()},250)}}
function today(d=new Date()){return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()}
function updateStreak(){let t=today(),y=new Date();y.setDate(y.getDate()-1);if(data.lastDaily===t)return;data.streak=data.lastDaily===today(y)?data.streak+1:1;data.lastDaily=t}
function addTop(){if(score<=0)return;data.top.push({s:score,m:mode,d:new Date().toLocaleDateString()});data.top.sort((a,b)=>b.s-a.s);data.top=data.top.slice(0,5)}
function setDiff(n){data.diff=n;save();toast(["😌 Easy","🙂 Normal","🔥 Hard"][n]+" selected")}
const THEMES=[["neon","🌌 Neon"],["jewel","💎 Jewel Jungle"],["wood","🪵 Wood"],["sunset","🌅 Sunset"],["forest","🌿 Forest"]];let adTarget=null,adTimer=null;
function openThemes(){renderThemes();$("themeModal").classList.add("show")}
function closeThemes(){$("themeModal").classList.remove("show")}
function renderThemes(){$("themeList").innerHTML=THEMES.map(([k,n])=>{let on=data.theme===k,open=data.unlocked.includes(k);return `<button class="btn" style="margin:0;${on?'border-color:#00eaff':''}" onclick="pickTheme('${k}')">${n} · ${on?'✓ Active':open?'Use':'🔒 Watch ad to unlock'}</button>`}).join("")}
function pickTheme(k){if(data.unlocked.includes(k)){data.theme=k;document.body.dataset.theme=k;save();renderThemes();return}adTarget=k;closeThemes();let left=5,b=$("adBtn");b.disabled=true;b.style.opacity=.5;$("adText").textContent="Ad ends in "+left+"s";$("adModal").classList.add("show");clearInterval(adTimer);adTimer=setInterval(()=>{left--;if(left>0){$("adText").textContent="Ad ends in "+left+"s";return}clearInterval(adTimer);adTimer=null;$("adText").textContent="Ad finished ✓";b.disabled=false;b.style.opacity=1},1000)}
function closeAd(){let rv=adTarget==="__revive";clearInterval(adTimer);adTimer=null;adTarget=null;$("adModal").classList.remove("show");if(rv)finish(false,"No valid moves remaining!")}
function claimAd(){if(!adTarget)return;let k=adTarget;if(k==="__revive"){adTarget=null;closeAd();doRevive();return}if(k==="__coins"||k==="__gem"){if(k==="__coins")data.coins+=100;else data.gems+=1;save();closeAd();toast(k==="__coins"?"🪙 +100 coins!":"💎 +1 gem!");return}data.unlocked.push(k);data.ach.theme=true;data.theme=k;document.body.dataset.theme=k;save();closeAd();toast("🎉 Theme unlocked!")}
function bumpScore(){let s=$("score");s.classList.remove("bump");void s.offsetWidth;s.classList.add("bump")}
function homeUI2(){[["best","best2"],["played","played2"],["achCount","ach2"],["streak","streak2"]].forEach(([a,b])=>$(b).textContent=$(a).textContent);$("gems").textContent=data.gems;rewardUI()}
function showInfo(t,h){$("infoTitle").textContent=t;$("infoBody").innerHTML=h;$("infoModal").classList.add("show")}
function closeInfo(){paused=false;$("infoModal").classList.remove("show");if(reviveOpen){reviveOpen=false;finish(false,"No valid moves remaining!")}}
function openAch(){showInfo("🏆 Achievements",$("achList").innerHTML)}
function openLB(){showInfo("📊 Leaderboard",$("topList").innerHTML)}
function openSettings(){showInfo("⚙️ Settings",`<button class="btn" style="margin:0" onclick="toggleSound();openSettings()">${data.sound?"🔊 Sound: ON":"🔇 Sound: OFF"}</button><div style="font-size:12px;color:#9aabc4">Difficulty</div><div class="diff">${["😌 Easy","🙂 Normal","🔥 Hard"].map((n,i)=>`<button class="${data.diff===i?'on':''}" onclick="setDiff(${i});openSettings()">${n}</button>`).join("")}</div>`)}
function openShop(){showInfo("🛒 Shop",[[3,100],[10,400],[25,1200]].map(([g,c])=>`<button class="btn" style="margin:0" onclick="buy(${g},${c})">💎 ${g} → 🪙 ${c}</button>`).join("")+`<button class="btn play" style="margin:0" onclick="closeInfo();pickTheme('__gem')">📺 Watch ad: +1 💎</button>`)}
function buy(g,c){if(data.gems<g){toast("⚠️ Not enough gems!");return}data.gems-=g;data.coins+=c;save();toast("🪙 +"+c+" coins")}
function rewardUI(){let t=$("rwTime");if(!t)return;if(data.lastReward!==today()){t.textContent="Claim now!";$("rwBadge").style.display="block"}else{let n=new Date(),m=new Date(n.getFullYear(),n.getMonth(),n.getDate()+1),s=Math.floor((m-n)/1000),p=x=>String(x).padStart(2,"0");t.textContent=p(Math.floor(s/3600))+":"+p(Math.floor(s%3600/60))+":"+p(s%60);$("rwBadge").style.display="none"}}
function claimReward(){if(data.lastReward===today()){toast("⏳ Come back when the timer ends");return}data.lastReward=today();data.coins+=100;data.gems+=2;save();toast("🎁 +100 🪙  +2 💎");confetti()}
setInterval(rewardUI,1000);
const PR=[["🪙20","coins",20,25],["🪙50","coins",50,20],["🪙100","coins",100,15],["💎1","gems",1,12],["🪙200","coins",200,10],["💎2","gems",2,8],["🪙500","coins",500,6],["💎5","gems",5,4]];let rot=0,spinning=false;
function spinLabel(){return data.lastSpin!==today()?"🎡 FREE SPIN":"🎡 SPIN (1💎)"}
function openSpin(){showInfo("🎡 Spin Wheel",`<div class="wwrap"><div class="wheel" id="wheel" style="transform:rotate(${rot}deg)">${PR.map((p,i)=>`<div class="wl" style="transform:rotate(${i*45+22.5}deg)"><b>${p[0]}</b></div>`).join("")}</div></div><button class="btn play" id="spinBtn" style="margin:0" onclick="spin()">${spinLabel()}</button>`)}
function spin(){if(spinning)return;if(data.lastSpin!==today())data.lastSpin=today();else{if(data.gems<1){toast("⚠️ Need 1 💎 to spin");return}data.gems--}let tot=PR.reduce((a,p)=>a+p[3],0),r=Math.random()*tot,i=0;for(;i<PR.length-1;i++){r-=PR[i][3];if(r<=0)break}spinning=true;rot=rot-(rot%360)+1800+(360-(i*45+22.5));$("wheel").style.transform=`rotate(${rot}deg)`;setTimeout(()=>{let p=PR[i];data[p[1]]+=p[2];data.ach.spin=true;save();spinning=false;toast("🎉 You won "+p[0]);confetti();let b=$("spinBtn");if(b)b.textContent=spinLabel()},3300)}
let paused=false,rng=Math.random,powerMode=null,revived=false,reviveOpen=false;
function seedRng(){let s=0,t=today();for(let i=0;i<t.length;i++)s=(s*31+t.charCodeAt(i))>>>0;return()=>{s=(s+0x6D2B79F5)>>>0;let x=s;x=Math.imul(x^x>>>15,x|1);x^=x+Math.imul(x^x>>>7,x|61);return((x^x>>>14)>>>0)/4294967296}}
function pauseGame(){if(gameOver)return;paused=true;showInfo("⏸ Paused",`<button class="btn play" style="margin:0" onclick="closeInfo()">▶ Resume</button><button class="btn" style="margin:0" onclick="startGame(mode)">🔄 Restart</button><button class="btn" style="margin:0" onclick="closeInfo();goHome()">🏠 Home</button>`)}
function tutor(){try{if(localStorage.getItem("bpe_tut"))return;localStorage.setItem("bpe_tut","1")}catch(e){return}if(gameOver)return;showInfo("👋 How to play",`<div style="font-size:13px;line-height:1.7;text-align:left">🧩 Drag a piece onto the board, or tap a piece and then a cell.<br>✨ Fill a full row or column to clear it.<br>🔥 Clear lines back to back for big combos.<br>🔄 Rotate, ↩️ Undo, 🔨 Hammer and 💣 Bomb help when you are stuck.</div>`);paused=true}
function updPower(){[["hammer","hamBtn"],["bomb","bombBtn"]].forEach(([k,id])=>{let b=$(id);if(b)b.classList.toggle("armed",powerMode===k)})}
function armPower(k){if(gameOver)return;if(powerMode===k){powerMode=null;updPower();toast("Cancelled");return}let cost=k==="hammer"?30:60;if(data.coins<cost){toast("⚠️ Need "+cost+" coins!");return}powerMode=k;updPower();toast(k==="hammer"?"🔨 Tap a block to smash it":"💣 Tap to blast a 3×3 area")}
function usePower(r,c){let k=powerMode,cost=k==="hammer"?30:60,cells=[];if(k==="hammer"){if(grid[r][c])cells.push([r,c])}else for(let y=r-1;y<=r+1;y++)for(let x=c-1;x<=c+1;x++)if(y>=0&&y<10&&x>=0&&x<10&&grid[y][x])cells.push([y,x]);if(!cells.length){toast("⚠️ Tap a filled block");return}if(data.coins<cost){powerMode=null;updPower();toast("⚠️ Need "+cost+" coins!");return}data.coins-=cost;cells.forEach(([y,x])=>{grid[y][x]="";fx.pop.add(y+","+x)});powerMode=null;updPower();backup=null;sound(k==="bomb"?300:420,"square",.15);save();renderBoard();hud();checkMoves()}
function offerRevive(){if(gameOver)return;if(revived||mode==="time"){finish(false,"No valid moves remaining!");return}reviveOpen=true;showInfo("😵 No moves left!",`<div style="font-size:13px;color:#9aabc4">Revive clears 4 rows in the middle so you can keep playing. Once per game.</div><button class="btn play" style="margin:0" onclick="reviveAd()">📺 Watch ad to revive</button><button class="btn" style="margin:0" onclick="reviveGem()">💎 Revive for 2 gems</button><button class="btn" style="margin:0" onclick="reviveNo()">No thanks</button>`)}
function reviveAd(){reviveOpen=false;closeInfo();pickTheme("__revive")}
function reviveGem(){if(data.gems<2){toast("⚠️ Need 2 gems");return}data.gems-=2;save();reviveOpen=false;closeInfo();doRevive()}
function reviveNo(){reviveOpen=false;closeInfo();finish(false,"No valid moves remaining!")}
function doRevive(){revived=true;for(let r=3;r<7;r++)for(let c=0;c<10;c++){if(grid[r][c])fx.pop.add(r+","+c);grid[r][c]=""}backup=null;sound(880,"triangle",.2);renderBoard();renderTray();hud();toast("💫 Revived!");checkMoves()}
let cellsArr=[],gEls=[],bO=null,fW=0,fH=0,lastKey="",raf=0,lastPt=null;
function beginDrag(e,i){if(gameOver||!tray[i]||e.button===2)return;e.preventDefault();cancelDrag();dragIndex=i;dragId=e.pointerId;selected=i;let p=tray[i],f=$("floater");cellsArr=Array.from($("board").children);let r0=cellsArr[0].getBoundingClientRect(),r1=cellsArr[1].getBoundingClientRect(),cs=r0.width;floatCell=cs;bO={l:r0.left,t:r0.top,p:r1.left-r0.left};f.innerHTML="";let m=buildMini(p);m.style.setProperty("--ms",cs+"px");f.appendChild(m);f.style.display="block";let fr=f.getBoundingClientRect();fW=fr.width;fH=fr.height;lastKey="";gEls=[];moveFloat(e.clientX,e.clientY);window.addEventListener("pointermove",dragMove,{passive:false});window.addEventListener("pointerup",dragEnd);window.addEventListener("pointercancel",dragCancel);document.querySelectorAll("#tray .slot").forEach((s,k)=>s.classList.toggle("selected",k===i))}
function moveFloat(x,y){$("floater").style.transform="translate3d("+x+"px,"+y+"px,0) translate(-50%,-115%)"}
function anchorCell(x,y){moveFloat(x,y);let ax=x-fW/2+floatCell/2,ay=y-1.15*fH+floatCell/2,c=Math.floor((ax-bO.l)/bO.p),r=Math.floor((ay-bO.t)/bO.p);return r<0||c<0||r>9||c>9?null:{r:r,c:c}}
function clearGhost(){gEls.forEach(e=>e.classList.remove("ghost-ok","ghost-no"));gEls=[]}
function ghost(p,r,c){let ok=fits(p.m,r,c);p.m.forEach((row,y)=>row.forEach((v,x)=>{if(!v||r+y>9||c+x>9)return;let e=cellsArr[(r+y)*10+c+x];if(e){e.classList.add(ok?"ghost-ok":"ghost-no");gEls.push(e)}}))}
function dragMove(e){if(dragIndex===null||e.pointerId!==dragId)return;e.preventDefault();lastPt=[e.clientX,e.clientY];if(raf)return;raf=requestAnimationFrame(()=>{raf=0;if(dragIndex===null||!lastPt)return;let pos=anchorCell(lastPt[0],lastPt[1]),k=pos?pos.r+","+pos.c:"";if(k===lastKey)return;lastKey=k;clearGhost();if(pos&&tray[dragIndex])ghost(tray[dragIndex],pos.r,pos.c)})}
document.addEventListener("contextmenu",e=>e.preventDefault());
const GH={"c-blue":"#38bdf8","c-purple":"#a78bfa","c-pink":"#f472b6","c-green":"#34d399","c-amber":"#fbbf24","c-red":"#fb7185"};let shownScore=0,twRaf=0;
function burst(x,y,col,n){for(let i=0;i<n;i++){let d=document.createElement("i");d.className="spk";d.style.cssText=`left:${x}px;top:${y}px;background:${col};--dx:${(Math.random()-.5)*110}px;--dy:${(Math.random()-.9)*110}px`;document.body.appendChild(d);setTimeout(()=>d.remove(),700)}}
function sparkle(set){let keys=[...set],step=Math.max(1,Math.ceil(keys.length/18)),bd=$("board").children;keys.forEach((k,i)=>{if(i%step)return;let [r,c]=k.split(",").map(Number),el=bd[r*10+c];if(!el)return;let b=el.getBoundingClientRect();burst(b.left+b.width/2,b.top+b.height/2,GH[grid[r][c]]||"#fff",3)})}
function popText(t,sub){let b=$("board").getBoundingClientRect(),d=document.createElement("div");d.className="ptxt";d.innerHTML=t+"<small>"+sub+"</small>";d.style.left=b.left+b.width/2+"px";d.style.top=b.top+b.height*.4+"px";document.body.appendChild(d);setTimeout(()=>d.remove(),1000)}
function confetti(){let cols=Object.values(GH);for(let i=0;i<40;i++){let d=document.createElement("i");d.className="spk";d.style.cssText=`left:${Math.random()*innerWidth}px;top:-10px;background:${cols[i%cols.length]};--dx:${(Math.random()-.5)*120}px;--dy:${innerHeight*.9}px;animation-duration:${1.4+Math.random()*.8}s;animation-delay:${Math.random()*.4}s`;document.body.appendChild(d);setTimeout(()=>d.remove(),2800)}}
function tweenScore(){cancelAnimationFrame(twRaf);let el=$("score");if(score<shownScore){shownScore=score;el.textContent=score;return}let step=()=>{shownScore=Math.min(score,shownScore+Math.max(1,Math.ceil((score-shownScore)/6)));el.textContent=shownScore;if(shownScore<score)twRaf=requestAnimationFrame(step)};step()}
function moveFloat(x,y){$("floater").style.transform="translate3d("+x+"px,"+y+"px,0) translate(-50%,calc(-100% - 44px))"}
function anchorCell(x,y){moveFloat(x,y);let ax=x-fW/2+floatCell/2,ay=y-fH-44+floatCell/2,c=Math.floor((ax-bO.l)/bO.p),r=Math.floor((ay-bO.t)/bO.p);return r<0||c<0||r>9||c>9?null:{r:r,c:c}}
function finish(won,msg){if(gameOver)return;gameOver=true;clearTimers();cancelDrag();data.played++;let nb=score>data.best&&score>0;data.best=Math.max(data.best,score);if(nb||won)confetti();let reward=Math.max(10,Math.round(score*.25*[.8,1,1.5][data.diff]));data.coins+=reward;addTop();data.ach.first=true;if(score>=100)data.ach.s100=true;if(score>=500)data.ach.s500=true;if(score>=1000)data.ach.s1000=true;if(data.played>=10)data.ach.play10=true;if(won&&mode==="daily"){data.ach.daily=true;updateStreak()}save();sound(won?980:180,"triangle",.2);$("resultTitle").textContent=won?"🎉 VICTORY!":"🏁 GAME OVER";$("resultScore").textContent=score+" Pts";$("resultMsg").textContent=msg+(won&&mode==="daily"?" 🔥 Streak "+data.streak+".":"")+" (+"+reward+" Coins earned 🪙)";$("modal").classList.add("show")}
homeUI();
</script></body></html>
