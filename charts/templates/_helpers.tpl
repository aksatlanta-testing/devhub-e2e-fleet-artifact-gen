
{{- define "go-echofcc9e0e9-cd0f-4e13-bde5-2c8e3b5e702d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofcc9e0e9-cd0f-4e13-bde5-2c8e3b5e702d.fullname" -}}
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


{{- define "go-echofcc9e0e9-cd0f-4e13-bde5-2c8e3b5e702d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofcc9e0e9-cd0f-4e13-bde5-2c8e3b5e702d.labels" -}}
helm.sh/chart: {{ include "go-echofcc9e0e9-cd0f-4e13-bde5-2c8e3b5e702d.chart" . }}
{{ include "go-echofcc9e0e9-cd0f-4e13-bde5-2c8e3b5e702d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofcc9e0e9-cd0f-4e13-bde5-2c8e3b5e702d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofcc9e0e9-cd0f-4e13-bde5-2c8e3b5e702d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}