
{{- define "go-echo81108b29-0952-4d61-96b2-06b608b5756b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo81108b29-0952-4d61-96b2-06b608b5756b.fullname" -}}
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


{{- define "go-echo81108b29-0952-4d61-96b2-06b608b5756b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo81108b29-0952-4d61-96b2-06b608b5756b.labels" -}}
helm.sh/chart: {{ include "go-echo81108b29-0952-4d61-96b2-06b608b5756b.chart" . }}
{{ include "go-echo81108b29-0952-4d61-96b2-06b608b5756b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo81108b29-0952-4d61-96b2-06b608b5756b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo81108b29-0952-4d61-96b2-06b608b5756b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}