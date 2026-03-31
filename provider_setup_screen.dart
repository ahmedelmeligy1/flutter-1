import 'package:flutter/material.dart';
import 'client_setup_screen.dart';

class ProviderSetupScreen extends StatefulWidget {
  @override
  _ProviderSetupScreenState createState() => _ProviderSetupScreenState();
}

class _ProviderSetupScreenState extends State<ProviderSetupScreen> {

  // ---- المتغيرات ----
  String selectedExperience = '5-8 Years';
  String bioText = '';

  // المهارات المختارة
  bool skillUIDesign     = true;
  bool skillPrototyping  = true;
  bool skillUserResearch = true;
  bool skillFigma        = false;
  bool skillWebflow      = false;
  bool skillSketch       = false;
  bool skillAdobeXD      = false;
  bool skillIllustrator  = false;
  bool skillPhotoshop    = false;
  bool skillReact        = false;
  bool skillFlutter      = false;
  bool skillSwift        = false;
  bool skillKotlin       = false;
  bool skillMotion       = false;
  bool skillBranding     = false;
  bool skillCopywriting  = false;
  bool skillSEO          = false;
  bool skillVideo        = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'WorkY',
          style: TextStyle(
            color: Color(0xFF4F46E5),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ---- شريط التقدم ----
            Row(
              children: [
                Text('STEP 2 OF 3', style: TextStyle(fontSize: 11, color: Colors.grey)),
                Spacer(),
                Text('PROFESSIONAL IDENTITY', style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
            SizedBox(height: 6),
            LinearProgressIndicator(
              value: 0.66,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4F46E5)),
            ),
            SizedBox(height: 24),

            // ---- العنوان ----
            Text(
              'Complete your\nprofessional profile',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Highlight your expertise to stand out to potential clients.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 28),

            // ---- Professional Title ----
            Text('PROFESSIONAL TITLE', style: labelStyle()),
            SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                hintText: 'e.g., Senior UI Designer',
                hintStyle: TextStyle(color: Colors.grey[400]),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF4F46E5)),
                ),
              ),
            ),
            SizedBox(height: 20),

            // ---- Years of Experience ----
            Text('YEARS OF EXPERIENCE', style: labelStyle()),
            SizedBox(height: 6),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: selectedExperience,
                isExpanded: true,
                underline: SizedBox(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedExperience = newValue!;
                  });
                },
                items: [
                  DropdownMenuItem(value: '1-2 Years', child: Text('1-2 Years')),
                  DropdownMenuItem(value: '3-4 Years', child: Text('3-4 Years')),
                  DropdownMenuItem(value: '5-8 Years', child: Text('5-8 Years')),
                  DropdownMenuItem(value: '8+ Years',  child: Text('8+ Years')),
                ],
              ),
            ),
            SizedBox(height: 20),

            // ---- Availability ----
            Text('AVAILABILITY', style: labelStyle()),
            SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.grey),
                SizedBox(width: 6),
                Text('Immediate Start'),
              ],
            ),
            SizedBox(height: 20),

            // ---- Short Bio ----
            Text('SHORT BIO', style: labelStyle()),
            SizedBox(height: 6),
            TextField(
              maxLines: 5,
              maxLength: 300,
              onChanged: (text) {
                setState(() {
                  bioText = text;
                });
              },
              decoration: InputDecoration(
                hintText: 'Briefly describe your background and what makes you unique...',
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13),
                contentPadding: EdgeInsets.all(12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF4F46E5)),
                ),
              ),
            ),
            SizedBox(height: 20),

            // ---- Top Skills ----
            Text('TOP SKILLS', style: labelStyle()),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [

                // كل مهارة بنشيل الـ X لما يدوس عليها
                if (skillUIDesign)
                  skillChip('UI Design', () {
                    setState(() { skillUIDesign = false; });
                  }),

                if (skillPrototyping)
                  skillChip('Prototyping', () {
                    setState(() { skillPrototyping = false; });
                  }),

                if (skillUserResearch)
                  skillChip('User Research', () {
                    setState(() { skillUserResearch = false; });
                  }),

                if (skillFigma)
                  skillChip('Figma', () {
                    setState(() { skillFigma = false; });
                  }),

                if (skillWebflow)
                  skillChip('Webflow', () {
                    setState(() { skillWebflow = false; });
                  }),

                if (skillSketch)
                  skillChip('Sketch', () {
                    setState(() { skillSketch = false; });
                  }),

                if (skillAdobeXD)
                  skillChip('Adobe XD', () {
                    setState(() { skillAdobeXD = false; });
                  }),

                if (skillIllustrator)
                  skillChip('Illustrator', () {
                    setState(() { skillIllustrator = false; });
                  }),

                if (skillPhotoshop)
                  skillChip('Photoshop', () {
                    setState(() { skillPhotoshop = false; });
                  }),

                if (skillReact)
                  skillChip('React', () {
                    setState(() { skillReact = false; });
                  }),

                if (skillFlutter)
                  skillChip('Flutter', () {
                    setState(() { skillFlutter = false; });
                  }),

                if (skillSwift)
                  skillChip('Swift', () {
                    setState(() { skillSwift = false; });
                  }),

                if (skillKotlin)
                  skillChip('Kotlin', () {
                    setState(() { skillKotlin = false; });
                  }),

                if (skillMotion)
                  skillChip('Motion Design', () {
                    setState(() { skillMotion = false; });
                  }),

                if (skillBranding)
                  skillChip('Branding', () {
                    setState(() { skillBranding = false; });
                  }),

                if (skillCopywriting)
                  skillChip('Copywriting', () {
                    setState(() { skillCopywriting = false; });
                  }),

                if (skillSEO)
                  skillChip('SEO', () {
                    setState(() { skillSEO = false; });
                  }),

                if (skillVideo)
                  skillChip('Video Editing', () {
                    setState(() { skillVideo = false; });
                  }),

              ],
            ),
            SizedBox(height: 16),

            // ---- Add a Skill ----
            Text('ADD A SKILL', style: labelStyle()),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                hint: Text('Choose a skill...', style: TextStyle(color: Colors.grey, fontSize: 13)),
                isExpanded: true,
                underline: SizedBox(),
                onChanged: (String? chosen) {
                  setState(() {
                    if (chosen == 'Figma')        skillFigma        = true;
                    if (chosen == 'Webflow')      skillWebflow      = true;
                    if (chosen == 'Sketch')       skillSketch       = true;
                    if (chosen == 'Adobe XD')     skillAdobeXD      = true;
                    if (chosen == 'Illustrator')  skillIllustrator  = true;
                    if (chosen == 'Photoshop')    skillPhotoshop    = true;
                    if (chosen == 'React')        skillReact        = true;
                    if (chosen == 'Flutter')      skillFlutter      = true;
                    if (chosen == 'Swift')        skillSwift        = true;
                    if (chosen == 'Kotlin')       skillKotlin       = true;
                    if (chosen == 'Motion Design') skillMotion      = true;
                    if (chosen == 'Branding')     skillBranding     = true;
                    if (chosen == 'Copywriting')  skillCopywriting  = true;
                    if (chosen == 'SEO')          skillSEO          = true;
                    if (chosen == 'Video Editing') skillVideo       = true;
                  });
                },
                items: [
                  if (!skillFigma)        DropdownMenuItem(value: 'Figma',         child: Text('Figma')),
                  if (!skillWebflow)      DropdownMenuItem(value: 'Webflow',       child: Text('Webflow')),
                  if (!skillSketch)       DropdownMenuItem(value: 'Sketch',        child: Text('Sketch')),
                  if (!skillAdobeXD)      DropdownMenuItem(value: 'Adobe XD',      child: Text('Adobe XD')),
                  if (!skillIllustrator)  DropdownMenuItem(value: 'Illustrator',   child: Text('Illustrator')),
                  if (!skillPhotoshop)    DropdownMenuItem(value: 'Photoshop',     child: Text('Photoshop')),
                  if (!skillReact)        DropdownMenuItem(value: 'React',         child: Text('React')),
                  if (!skillFlutter)      DropdownMenuItem(value: 'Flutter',       child: Text('Flutter')),
                  if (!skillSwift)        DropdownMenuItem(value: 'Swift',         child: Text('Swift')),
                  if (!skillKotlin)       DropdownMenuItem(value: 'Kotlin',        child: Text('Kotlin')),
                  if (!skillMotion)       DropdownMenuItem(value: 'Motion Design', child: Text('Motion Design')),
                  if (!skillBranding)     DropdownMenuItem(value: 'Branding',      child: Text('Branding')),
                  if (!skillCopywriting)  DropdownMenuItem(value: 'Copywriting',   child: Text('Copywriting')),
                  if (!skillSEO)          DropdownMenuItem(value: 'SEO',           child: Text('SEO')),
                  if (!skillVideo)        DropdownMenuItem(value: 'Video Editing', child: Text('Video Editing')),
                ],
              ),
            ),
            SizedBox(height: 28),

            // ---- Save for later ----
            Center(
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.bookmark_border, size: 16, color: Colors.grey),
                label: Text('Save for later', style: TextStyle(color: Colors.grey)),
              ),
            ),
            SizedBox(height: 8),

            // ---- زر Continue ----
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4F46E5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ClientSetupScreen()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Continue', style: TextStyle(fontSize: 16, color: Colors.white)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

  // ---- ويدجت الـ Skill الأزرق مع X ----
  Widget skillChip(String name, VoidCallback onRemove) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFF4F46E5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(name, style: TextStyle(fontSize: 12, color: Colors.white)),
          SizedBox(width: 6),
          GestureDetector(
            onTap: onRemove,
            child: Icon(Icons.close, size: 14, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  // ---- ستايل العناوين الصغيرة ----
  TextStyle labelStyle() {
    return TextStyle(
      fontSize: 11,
      color: Colors.grey,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
    );
  }
}
