
{{- define "go-echobe28064f-8cc6-4571-b100-b19784bb8caa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobe28064f-8cc6-4571-b100-b19784bb8caa.fullname" -}}
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


{{- define "go-echobe28064f-8cc6-4571-b100-b19784bb8caa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobe28064f-8cc6-4571-b100-b19784bb8caa.labels" -}}
helm.sh/chart: {{ include "go-echobe28064f-8cc6-4571-b100-b19784bb8caa.chart" . }}
{{ include "go-echobe28064f-8cc6-4571-b100-b19784bb8caa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobe28064f-8cc6-4571-b100-b19784bb8caa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobe28064f-8cc6-4571-b100-b19784bb8caa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}