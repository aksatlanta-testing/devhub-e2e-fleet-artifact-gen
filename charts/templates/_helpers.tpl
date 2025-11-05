
{{- define "go-echo6ff82078-ab20-46e8-b2ad-460be78c6617.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6ff82078-ab20-46e8-b2ad-460be78c6617.fullname" -}}
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


{{- define "go-echo6ff82078-ab20-46e8-b2ad-460be78c6617.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6ff82078-ab20-46e8-b2ad-460be78c6617.labels" -}}
helm.sh/chart: {{ include "go-echo6ff82078-ab20-46e8-b2ad-460be78c6617.chart" . }}
{{ include "go-echo6ff82078-ab20-46e8-b2ad-460be78c6617.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6ff82078-ab20-46e8-b2ad-460be78c6617.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6ff82078-ab20-46e8-b2ad-460be78c6617.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}