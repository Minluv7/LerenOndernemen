<template>
  <div class="relative h-screen">
    <div class="absolute inset-0">
      <svg xmlns="http://www.w3.org/2000/svg" class="" width="100%" height="100%" viewBox="0 0 375 943" fill="none" preserveAspectRatio="xMidYMid slice">
          <path d="M135.934 1017.25C-128.85 1016.52 -27.5476 868.911 -30.7484 719.215C-43.1661 515.531 61.5575 769.814 131.39 619.484C362.857 76.8401 915.041 -211.46 1298.22 184.483C1644.65 465.201 881.612 1019.28 135.934 1017.25Z" fill="#89C2D9"/>
          <path d="M135.934 1017.25C-128.85 1016.52 -27.5476 868.911 -30.7484 719.215C-43.1661 515.531 61.5575 769.814 131.39 619.484C362.857 76.8401 915.041 -211.46 1298.22 184.483C1644.65 465.201 881.612 1019.28 135.934 1017.25Z" fill="url(#paint0_linear_197_278)"/>
          <path d="M135.934 1017.25C-128.85 1016.52 -27.5476 868.911 -30.7484 719.215C-43.1661 515.531 61.5575 769.814 131.39 619.484C362.857 76.8401 915.041 -211.46 1298.22 184.483C1644.65 465.201 881.612 1019.28 135.934 1017.25Z" fill="#89C2D9"/>
          <path d="M135.934 1017.25C-128.85 1016.52 -27.5476 868.911 -30.7484 719.215C-43.1661 515.531 61.5575 769.814 131.39 619.484C362.857 76.8401 915.041 -211.46 1298.22 184.483C1644.65 465.201 881.612 1019.28 135.934 1017.25Z" fill="url(#paint1_linear_197_278)"/>
            <defs>
              <linearGradient id="paint0_linear_197_278" x1="63.0466" y1="590.341" x2="334.258" y2="530.645" gradientUnits="userSpaceOnUse">
                <stop stop-color="#267FA6" stop-opacity="0"/>
                <stop offset="1" stop-color="#C2D6DF"/>
              </linearGradient>
              <linearGradient id="paint1_linear_197_278" x1="63.0466" y1="590.341" x2="334.258" y2="530.645" gradientUnits="userSpaceOnUse">
                <stop stop-color="#267FA6" stop-opacity="0"/>
                <stop offset="1" stop-color="#C2D6DF"/>
              </linearGradient>
            </defs>
      </svg>
    </div>

      <div class=" footer-text absolute inset-4 flex flex-col items-start justify-end gap-1">
          <div class="flex flex-col">
              <h2 class=" underline " style="font-size: 20px; text-shadow: 0 0 black;">Over ons</h2>
              <ul>
                  <li><p>Email: eb@education.business.be</p></li>
                  <li> <p>Tel: +32 453 45 24 22</p></li>
                  <li><p>Brusselsesteenweg 90, 9000 Gent</p></li>
                  <li><p>BTW: BE0123.456.789</p></li>
              </ul>
          </div>
          <div class="flex flex-col">
              <h2 class=" underline" style="font-size: 20px; text-shadow: 0 0 black;">Privacy en voorwaarden</h2>
              <ul>
                  <a href="#">
                      <li class="underline"><p>Privacy</p></li>
                  </a>
                  <a href="#">
                      <li class="underline"><p>Algemene voorwaarden</p></li>
                  </a>
              </ul>
          </div>
      </div>
 
  </div>
</template>

<script>
export default {
        
    }
</script>

<style scoped>
.footer-text {
       flex-wrap: wrap;
    display: flex;
    gap: 2rem;
    flex-direction: row;
    align-items: flex-start;
    align-content: end;
    justify-content: left;
}

</style>