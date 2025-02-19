
{{- define "go-echo9067bb67-0aba-4741-b39e-e8917c0e18ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9067bb67-0aba-4741-b39e-e8917c0e18ee.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo9067bb67-0aba-4741-b39e-e8917c0e18ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9067bb67-0aba-4741-b39e-e8917c0e18ee.labels" -}}
helm.sh/chart: {{ include "go-echo9067bb67-0aba-4741-b39e-e8917c0e18ee.chart" . }}
{{ include "go-echo9067bb67-0aba-4741-b39e-e8917c0e18ee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9067bb67-0aba-4741-b39e-e8917c0e18ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9067bb67-0aba-4741-b39e-e8917c0e18ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}