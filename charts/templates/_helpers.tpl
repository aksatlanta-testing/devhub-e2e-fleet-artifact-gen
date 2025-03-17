
{{- define "go-echoa2de71ba-c592-4f74-8219-96daa7306f73.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa2de71ba-c592-4f74-8219-96daa7306f73.fullname" -}}
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


{{- define "go-echoa2de71ba-c592-4f74-8219-96daa7306f73.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa2de71ba-c592-4f74-8219-96daa7306f73.labels" -}}
helm.sh/chart: {{ include "go-echoa2de71ba-c592-4f74-8219-96daa7306f73.chart" . }}
{{ include "go-echoa2de71ba-c592-4f74-8219-96daa7306f73.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa2de71ba-c592-4f74-8219-96daa7306f73.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa2de71ba-c592-4f74-8219-96daa7306f73.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}