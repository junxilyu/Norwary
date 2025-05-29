import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/bottom_nav_bar.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('统计'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSummaryCards(),
            _buildWeeklyChart(),
            _buildMonthlyChart(),
            _buildAchievementList(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

  Widget _buildSummaryCards() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _buildSummaryCard(
              '总挑战',
              '12',
              Icons.flag,
              Colors.blue,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildSummaryCard(
              '已完成',
              '8',
              Icons.check_circle,
              Colors.green,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildSummaryCard(
              '进行中',
              '4',
              Icons.trending_up,
              Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyChart() {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '本周进度',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 3),
                      const FlSpot(1, 1),
                      const FlSpot(2, 4),
                      const FlSpot(3, 2),
                      const FlSpot(4, 5),
                      const FlSpot(5, 3),
                      const FlSpot(6, 4),
                    ],
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 3,
                    dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthlyChart() {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '月度统计',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 20,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                barGroups: [
                  BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 8)]),
                  BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 12)]),
                  BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 6)]),
                  BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 15)]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementList() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '成就',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue[100],
                  child: Icon(
                    Icons.emoji_events,
                    color: Colors.blue[700],
                  ),
                ),
                title: Text('成就 ${index + 1}'),
                subtitle: Text('完成于 ${DateTime.now().toString()}'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: 导航到成就详情页面
                },
              );
            },
          ),
        ],
      ),
    );
  }
} 