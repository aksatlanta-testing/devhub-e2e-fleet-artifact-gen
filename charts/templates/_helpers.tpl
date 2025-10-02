
{{- define "go-echoc5590687-5c6a-4379-a79b-09e1bcf513cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc5590687-5c6a-4379-a79b-09e1bcf513cc.fullname" -}}
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


{{- define "go-echoc5590687-5c6a-4379-a79b-09e1bcf513cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc5590687-5c6a-4379-a79b-09e1bcf513cc.labels" -}}
helm.sh/chart: {{ include "go-echoc5590687-5c6a-4379-a79b-09e1bcf513cc.chart" . }}
{{ include "go-echoc5590687-5c6a-4379-a79b-09e1bcf513cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc5590687-5c6a-4379-a79b-09e1bcf513cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc5590687-5c6a-4379-a79b-09e1bcf513cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}