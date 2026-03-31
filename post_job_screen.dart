import 'package:flutter/material.dart';

class PostJobScreen extends StatefulWidget {
  @override
  _PostJobScreenState createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {

  // ---- المتغيرات ----
  String selectedCategory = 'Design';
  String selectedDuration = '1-3 Months';
  String selectedRate     = 'Fixed';
  String jobDescription   = '';
  int    jobDescCount     = 0;
  bool   boostEnabled     = true;
  int    currentTabIndex  = 2;
  double budgetValue      = 10;

  // المهارات المطلوبة
  bool skillFigma        = true;
  bool skillUIDesign     = true;
  bool skillReactJS      = false;
  bool skillTypeScript   = false;
  bool skillPrototyping  = false;
  bool skillMotion       = false;

  // دالة بسيطة تحول الرقم لفورمات مثل 4,500
  String formatMoney(double value) {
    int number = value.toInt();

    if (number >= 10000) {
      String s = number.toString();
      String firstPart = s.substring(0, s.length - 3);
      String lastPart  = s.substring(s.length - 3);
      return firstPart + ',' + lastPart;
    }

    if (number >= 1000) {
      String s = number.toString();
      return s[0] + ',' + s.substring(1);
    }

    return number.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Post a Job',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ---- عنوان القسم ----
            Row(
              children: [
                Container(width: 3, height: 20, color: Color(0xFF4F46E5)),
                SizedBox(width: 8),
                Text(
                  'Project Details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),

            // ---- Project Title ----
            Text('PROJECT TITLE', style: labelStyle()),
            SizedBox(height: 4),
            TextField(
              decoration: InputDecoration(
                hintText: 'e.g. Senior Mobile App Designer',
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
            SizedBox(height: 14),

            // ---- Category و Duration ----
            Row(
              children: [

                // Category
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CATEGORY', style: labelStyle()),
                      SizedBox(height: 4),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(
                          value: selectedCategory,
                          isExpanded: true,
                          underline: SizedBox(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCategory = newValue!;
                            });
                          },
                          items: [
                            DropdownMenuItem(value: 'Design',      child: Text('Design',      style: TextStyle(fontSize: 13))),
                            DropdownMenuItem(value: 'Development', child: Text('Development', style: TextStyle(fontSize: 13))),
                            DropdownMenuItem(value: 'Marketing',   child: Text('Marketing',   style: TextStyle(fontSize: 13))),
                            DropdownMenuItem(value: 'Writing',     child: Text('Writing',     style: TextStyle(fontSize: 13))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 12),

                // Duration
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('DURATION', style: labelStyle()),
                      SizedBox(height: 4),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(
                          value: selectedDuration,
                          isExpanded: true,
                          underline: SizedBox(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedDuration = newValue!;
                            });
                          },
                          items: [
                            DropdownMenuItem(value: '< 1 Month',   child: Text('< 1 Month',   style: TextStyle(fontSize: 13))),
                            DropdownMenuItem(value: '1-3 Months',  child: Text('1-3 Months',  style: TextStyle(fontSize: 13))),
                            DropdownMenuItem(value: '3-6 Months',  child: Text('3-6 Months',  style: TextStyle(fontSize: 13))),
                            DropdownMenuItem(value: '6+ Months',   child: Text('6+ Months',   style: TextStyle(fontSize: 13))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
            SizedBox(height: 14),

            // ---- Job Description ----
            Row(
              children: [
                Text('JOB DESCRIPTION', style: labelStyle()),
                Spacer(),
                Text('$jobDescCount / 1000', style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
            SizedBox(height: 4),
            TextField(
              maxLines: 5,
              maxLength: 1000,
              onChanged: (text) {
                setState(() {
                  jobDescription = text;
                  jobDescCount   = text.length;
                });
              },
              buildCounter: (context, {required currentLength, required isFocused, maxLength}) {
                return SizedBox.shrink();
              },
              decoration: InputDecoration(
                hintText: 'Describe the role, responsibilities, and key outcomes...',
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
            SizedBox(height: 14),

            // ---- Required Skills ----
            Text('REQUIRED SKILLS', style: labelStyle()),
            SizedBox(height: 6),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [

                if (skillFigma)
                  requiredSkillChip('Figma', () {
                    setState(() { skillFigma = false; });
                  }),

                if (skillUIDesign)
                  requiredSkillChip('UI Design', () {
                    setState(() { skillUIDesign = false; });
                  }),

                if (skillReactJS)
                  requiredSkillChip('React.js', () {
                    setState(() { skillReactJS = false; });
                  }),

                if (skillTypeScript)
                  requiredSkillChip('TypeScript', () {
                    setState(() { skillTypeScript = false; });
                  }),

                if (skillPrototyping)
                  requiredSkillChip('Prototyping', () {
                    setState(() { skillPrototyping = false; });
                  }),

                if (skillMotion)
                  requiredSkillChip('Motion', () {
                    setState(() { skillMotion = false; });
                  }),

              ],
            ),
            SizedBox(height: 14),

            // ---- Suggested Skills ----
            Text('SUGGESTED FOR YOU', style: labelStyle()),
            SizedBox(height: 6),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [

                if (!skillReactJS)
                  suggestedSkillChip('React.js', () {
                    setState(() { skillReactJS = true; });
                  }),

                if (!skillTypeScript)
                  suggestedSkillChip('TypeScript', () {
                    setState(() { skillTypeScript = true; });
                  }),

                if (!skillPrototyping)
                  suggestedSkillChip('Prototyping', () {
                    setState(() { skillPrototyping = true; });
                  }),

                if (!skillMotion)
                  suggestedSkillChip('Motion', () {
                    setState(() { skillMotion = true; });
                  }),

              ],
            ),
            SizedBox(height: 14),

            // ---- Estimated Budget ----
            Text('ESTIMATED BUDGET', style: labelStyle()),
            SizedBox(height: 6),
            Row(
              children: [
                Text(
                  '\$${formatMoney(budgetValue)}',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4F46E5),
                  ),
                ),
                SizedBox(width: 6),
                Text('USD', style: TextStyle(color: Colors.grey, fontSize: 14)),
                Spacer(),

                // زر Fixed
                GestureDetector(
                  onTap: () {
                    setState(() { selectedRate = 'Fixed'; });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: selectedRate == 'Fixed' ? Color(0xFF4F46E5) : Colors.grey[100],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'Fixed',
                      style: TextStyle(
                        fontSize: 12,
                        color: selectedRate == 'Fixed' ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 6),

                // زر Hourly
                GestureDetector(
                  onTap: () {
                    setState(() { selectedRate = 'Hourly'; });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: selectedRate == 'Hourly' ? Color(0xFF4F46E5) : Colors.grey[100],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'Hourly',
                      style: TextStyle(
                        fontSize: 12,
                        color: selectedRate == 'Hourly' ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text('MIN: \$10', style: TextStyle(fontSize: 11, color: Colors.grey)),
                Spacer(),
                Text('MAX: \$50K', style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),

            // ---- Slider ----
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Color(0xFF4F46E5),
                thumbColor: Color(0xFF4F46E5),
                inactiveTrackColor: Colors.grey[200],
                trackHeight: 3,
              ),
              child: Slider(
                value: budgetValue,
                min: 10,
                max: 50000,
                divisions: 4999,
                onChanged: (double newValue) {
                  setState(() {
                    budgetValue = newValue;
                  });
                },
              ),
            ),
            SizedBox(height: 14),

            // ---- Boost Card ----
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '⚡ Boost your reach',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Spacer(),
                      Switch(
                        value: boostEnabled,
                        activeColor: Colors.white,
                        onChanged: (bool newValue) {
                          setState(() {
                            boostEnabled = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Get 3x more applications by featuring your job at the top of the feed for 7 days.',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        '+\$49.00 USD',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'RECOMMENDED',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // ---- زر Publish ----
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
                onPressed: () {},
                child: Text(
                  'Publish Job Opportunity',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10),

            // ---- زر Save as Draft ----
            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Save as Draft',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
            ),
            SizedBox(height: 20),

          ],
        ),
      ),

      // ---- Bottom Navigation Bar ----
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF4F46E5),
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),      label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.work_outline),        label: 'My Jobs'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline),      label: 'Profile'),
        ],
      ),
    );
  }

  // ---- ويدجت مهارة مطلوبة مع X ----
  Widget requiredSkillChip(String name, VoidCallback onRemove) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(name, style: TextStyle(fontSize: 12)),
          SizedBox(width: 4),
          GestureDetector(
            onTap: onRemove,
            child: Icon(Icons.close, size: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // ---- ويدجت مهارة مقترحة ----
  Widget suggestedSkillChip(String name, VoidCallback onAdd) {
    return GestureDetector(
      onTap: onAdd,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(name, style: TextStyle(fontSize: 12)),
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
