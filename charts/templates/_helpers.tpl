
{{- define "go-echoafac68ca-c4c6-45c8-aaab-06967d5d588d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoafac68ca-c4c6-45c8-aaab-06967d5d588d.fullname" -}}
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


{{- define "go-echoafac68ca-c4c6-45c8-aaab-06967d5d588d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoafac68ca-c4c6-45c8-aaab-06967d5d588d.labels" -}}
helm.sh/chart: {{ include "go-echoafac68ca-c4c6-45c8-aaab-06967d5d588d.chart" . }}
{{ include "go-echoafac68ca-c4c6-45c8-aaab-06967d5d588d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoafac68ca-c4c6-45c8-aaab-06967d5d588d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoafac68ca-c4c6-45c8-aaab-06967d5d588d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}