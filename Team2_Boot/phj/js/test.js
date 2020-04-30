console.clear();

select = e => document.querySelector(e);
selectAll = e => document.querySelectorAll(e);

const container = select('.containerr');
let wArray = [161, 614, 189, 278, 404],
    tl;

function animate() {
    tl = gsap.timeline( { 
        delay: 0.5,
        repeat: -1, 
        defaults: {
            ease: "expo.inOut",
            duration: 2
        }
    });
    
    tl.from('.container__base', {
        scaleX: 0,
        duration: 2,
        transformOrigin: "top right",
        // ease: "expo"
    })
    
    .from('.moon__svg-rects rect', {
        scaleX: 0,
        stagger: 0.07,
        duration: 3,
        ease: "expo"
    }, "-=1.0")
    
    .to('.moon__txt-bg rect', {
        stagger: 0.14,
        scaleX: 1
    }, "-=2.5")
    
    .from('text', {
        x: function(i) {
            return -wArray[i]
        },
        ease: 'power4',
        stagger: 0.14
    }, "-=1.6")
    
    .from('.moon__img', {
        x: "+=200",
        ease: 'power4',
        duration: 15
    }, 0);
}

function init() {
    gsap.set(containerr, { autoAlpha: 1 });
    
    gsap.set('.moon__txt-bg rect', { 
         width: function(i) {
            return wArray[i]
        },
        scaleX: 0
    })
    
    animate();
    
    containerr.onclick = () => {
        tl.restart();
    }

}

function resize() {
	let vw = window.innerWidth;
    let vh = window.innerHeight;
	let wh = containerr.offsetWidth;
	let scaleFactor = 1;
    
    if(vw/vh >= 1) {
        scaleFactor = vh/wh
    }
    else {
        scaleFactor = vw/wh
    }
    
	if(scaleFactor<1) {
		gsap.set(containerr, { scale: scaleFactor });
	}
	else {
        gsap.set(containerr, { scale: 1 });
    }
}

window.onresize = resize;

window.onload = () => {
	init();
    resize();
    // GSDevTools.create();
};