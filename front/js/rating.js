let starImg1=document.getElementById('star-img1');
let starImg2=document.getElementById('star-img2');
let starImg3=document.getElementById('star-img3');
let starImg4=document.getElementById('star-img4');
let starImg5=document.getElementById('star-img5');
let linkSrc="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSJub25lIiBzdHJva2U9IiNmYmZmMDAiIHN0cm9rZS13aWR0aD0iMC41IiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGNsYXNzPSJsdWNpZGUgbHVjaWRlLXN0YXIiPjxwYXRoIGQ9Ik0xMS41MjUgMi4yOTVhLjUzLjUzIDAgMCAxIC45NSAwbDIuMzEgNC42NzlhMi4xMjMgMi4xMjMgMCAwIDAgMS41OTUgMS4xNmw1LjE2Ni43NTZhLjUzLjUzIDAgMCAxIC4yOTQuOTA0bC0zLjczNiAzLjYzOGEyLjEyMyAyLjEyMyAwIDAgMC0uNjExIDEuODc4bC44ODIgNS4xNGEuNTMuNTMgMCAwIDEtLjc3MS41NmwtNC42MTgtMi40MjhhMi4xMjIgMi4xMjIgMCAwIDAtMS45NzMgMEw2LjM5NiAyMS4wMWEuNTMuNTMgMCAwIDEtLjc3LS41NmwuODgxLTUuMTM5YTIuMTIyIDIuMTIyIDAgMCAwLS42MTEtMS44NzlMMi4xNiA5Ljc5NWEuNTMuNTMgMCAwIDEgLjI5NC0uOTA2bDUuMTY1LS43NTVhMi4xMjIgMi4xMjIgMCAwIDAgMS41OTctMS4xNnoiLz48L3N2Zz4=";
let linkSrcLiked="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSJub25lIiBzdHJva2U9IiNmYmZmMDAiIHN0cm9rZS13aWR0aD0iMyIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBjbGFzcz0ibHVjaWRlIGx1Y2lkZS1zdGFyIj48cGF0aCBkPSJNMTEuNTI1IDIuMjk1YS41My41MyAwIDAgMSAuOTUgMGwyLjMxIDQuNjc5YTIuMTIzIDIuMTIzIDAgMCAwIDEuNTk1IDEuMTZsNS4xNjYuNzU2YS41My41MyAwIDAgMSAuMjk0LjkwNGwtMy43MzYgMy42MzhhMi4xMjMgMi4xMjMgMCAwIDAtLjYxMSAxLjg3OGwuODgyIDUuMTRhLjUzLjUzIDAgMCAxLS43NzEuNTZsLTQuNjE4LTIuNDI4YTIuMTIyIDIuMTIyIDAgMCAwLTEuOTczIDBMNi4zOTYgMjEuMDFhLjUzLjUzIDAgMCAxLS43Ny0uNTZsLjg4MS01LjEzOWEyLjEyMiAyLjEyMiAwIDAgMC0uNjExLTEuODc5TDIuMTYgOS43OTVhLjUzLjUzIDAgMCAxIC4yOTQtLjkwNmw1LjE2NS0uNzU1YTIuMTIyIDIuMTIyIDAgMCAwIDEuNTk3LTEuMTZ6Ii8+PC9zdmc+"
starImg1.addEventListener('click',()=>{
    starImg1.src=linkSrcLiked; 
    starImg2.src=linkSrc;
    starImg3.src=linkSrc;
    starImg4.src=linkSrc;
    starImg5.src=linkSrc;

});
starImg2.addEventListener('click',()=>{
    starImg1.src=linkSrcLiked;
    starImg2.src=linkSrcLiked;
    starImg3.src=linkSrc;
    starImg4.src=linkSrc;
    starImg5.src=linkSrc;

});
starImg3.addEventListener('click',()=>{
    starImg1.src=linkSrcLiked;
    starImg2.src=linkSrcLiked;
    starImg3.src=linkSrcLiked;
    starImg4.src=linkSrc;
    starImg5.src=linkSrc;

});
starImg4.addEventListener('click',()=>{
    starImg1.src=linkSrcLiked;
    starImg2.src=linkSrcLiked;
    starImg3.src=linkSrcLiked;
    starImg4.src=linkSrcLiked;
    starImg5.src=linkSrc;

});
starImg5.addEventListener('click',()=>{
    starImg1.src=linkSrcLiked;
    starImg2.src=linkSrcLiked;
    starImg3.src=linkSrcLiked;
    starImg4.src=linkSrcLiked;
    starImg5.src=linkSrcLiked;

});
let rate_btn=document.getElementById('rate-btn');
rate_btn.addEventListener('click',()=>{
    if(starImg5.src===linkSrcLiked){
        rateNow(5);
        return;
    }
    if(starImg4.src===linkSrcLiked){
        rateNow(4);
        return;
    }
    if(starImg3.src===linkSrcLiked){
        rateNow(3);
        return;
    }
    if(starImg2.src===linkSrcLiked){
        rateNow(2);
        return;
    }
    if(starImg1.src===linkSrcLiked){
        rateNow(1);
        return;
    }    
})
function rateNow(num){
    

}