
{{- define "go-echo751df199-f1c2-48f4-867a-6fe59bc9fe7f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo751df199-f1c2-48f4-867a-6fe59bc9fe7f.fullname" -}}
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


{{- define "go-echo751df199-f1c2-48f4-867a-6fe59bc9fe7f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo751df199-f1c2-48f4-867a-6fe59bc9fe7f.labels" -}}
helm.sh/chart: {{ include "go-echo751df199-f1c2-48f4-867a-6fe59bc9fe7f.chart" . }}
{{ include "go-echo751df199-f1c2-48f4-867a-6fe59bc9fe7f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo751df199-f1c2-48f4-867a-6fe59bc9fe7f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo751df199-f1c2-48f4-867a-6fe59bc9fe7f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}