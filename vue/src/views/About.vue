<template>
  <div>

      <!-- <h1>About Your Librarians</h1> -->
     
  <div class="bio">
    <img src="../assets/alex.jpg" />
    <div class="about">
        <a href="https://www.linkedin.com/in/heyalexuland/" class="name">Alex Uland</a>
      
      <p>Hard working and easy going. Firm believer in "Teamwork makes the dream work!" 
          Find me backpacking in my free time or rolling for initiative when the weather is sour!
           I've spent over six years in the RFID and printed electronics industry as a consultant 
           and now find myself diving into a line of work, software development! I am passionate 
           about my teams and helping other bring out their best selves within the workplace.</p>
    </div>
  </div>
  <div class="bio">
    <img src="../assets/Amanda.jpg" />
    <div class="about">
        <a href="https://www.linkedin.com/in/amandabbrust/" class="name-right">Amanda Brust</a>
      
      <p> I realized that as much as I loved sharing information, I wanted to be the student again.
           I missed the thrill of puzzling my way through a particularly challenging task, 
           and I especially missed the triumph of figuring out how to make something work. 
           So I went back to tinkering around with some web design, and I decided to get serious 
           about becoming a Junior Software Developer, and it is possibly one of the best decisions 
           I have ever made. </p>
    </div>
  </div>
   <div class="bio">
    <img src="../assets/felicity.jpg" />
    <div class="about">
        <a href="https://www.linkedin.com/in/felicity-homman/" class="name">Felicity Homman</a>
      
      <p>I'm a highly passionate software developer, and have loved working with computers 
          from a young age. My journey began with writing HTML and CSS for personal websites, 
          and evolved to teaching myself the basics of C++ so that I could write code for my Sony
           AIBO robots; now it's time for me to continue that journey and to fuel my passion further! Nothing is more important to me than learning, learning, and then learning more about whatever I might be working with - both through experience and the people around me.</p>
    </div>
  </div>
  
  
  <div class="bio">
    <img src="../assets/Ruwayda.jpg" />
    <div class="about">
  
        <a href="https://www.linkedin.com/in/ruwaydajama/" class="name-right">Ruwayda Jama</a>
              <p></p>
      
      <p>Hard working and easy going. Firm believer in "Teamwork makes the dream work!" 
          Find me backpacking in my free time or rolling for initiative when the weather is sour!
           I've spent over six years in the RFID and printed electronics industry as a consultant 
           and now find myself diving into a line of work, software development! I am passionate 
           about my teams and helping other bring out their best selves within the workplace.</p>
    </div>
  </div>
  </div>
</template>

<script>
export default {

}
</script>

<style>
.bio {
  background-color: #F0F0F0;
  padding: 20px;
  margin-bottom: 20px;
  border: solid 1px #555;
   border: 8px solid #5DA2D5;
    background-color: #F3D250;
    margin: 20px;
    border-radius: 15px 15px 15px 15px;
}

.bio img {
  width: 150px;
  border-radius: 999px;
  margin: 0 10px;
  border: 5px solid #bb9d26;
}

.name {
    display: flex;
    font-weight: bolder;
    font-size: 2rem;
    font-family: 'Comfortaa', cursive;
}
.name-right {
    display: flex;
    flex-direction: row-reverse;
    font-weight: bold;
    font-size: 2rem;
    font-family: 'Comfortaa', cursive;
}
div.bio:nth-child(1) {
  display: flex;
}

div.bio:nth-child(2) {
  display: flex;
  flex-direction: row-reverse;
}
div.bio:nth-child(3) {
  display: flex;
}

div.bio:nth-child(4) {
  display: flex;
  flex-direction: row-reverse;
}
</style>