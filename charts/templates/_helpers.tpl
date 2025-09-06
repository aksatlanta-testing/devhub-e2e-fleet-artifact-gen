
{{- define "go-echob566c895-6e7e-4e56-9744-fbdcb14f700c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob566c895-6e7e-4e56-9744-fbdcb14f700c.fullname" -}}
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


{{- define "go-echob566c895-6e7e-4e56-9744-fbdcb14f700c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob566c895-6e7e-4e56-9744-fbdcb14f700c.labels" -}}
helm.sh/chart: {{ include "go-echob566c895-6e7e-4e56-9744-fbdcb14f700c.chart" . }}
{{ include "go-echob566c895-6e7e-4e56-9744-fbdcb14f700c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob566c895-6e7e-4e56-9744-fbdcb14f700c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob566c895-6e7e-4e56-9744-fbdcb14f700c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}