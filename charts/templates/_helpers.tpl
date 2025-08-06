
{{- define "go-echoa53104ea-aecf-413c-858c-d0955b5fdc1a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa53104ea-aecf-413c-858c-d0955b5fdc1a.fullname" -}}
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


{{- define "go-echoa53104ea-aecf-413c-858c-d0955b5fdc1a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa53104ea-aecf-413c-858c-d0955b5fdc1a.labels" -}}
helm.sh/chart: {{ include "go-echoa53104ea-aecf-413c-858c-d0955b5fdc1a.chart" . }}
{{ include "go-echoa53104ea-aecf-413c-858c-d0955b5fdc1a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa53104ea-aecf-413c-858c-d0955b5fdc1a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa53104ea-aecf-413c-858c-d0955b5fdc1a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}