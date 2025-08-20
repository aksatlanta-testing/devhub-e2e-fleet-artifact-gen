
{{- define "go-echof64fc5aa-eb34-40a6-a6d0-f00fdc0e4e3c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof64fc5aa-eb34-40a6-a6d0-f00fdc0e4e3c.fullname" -}}
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


{{- define "go-echof64fc5aa-eb34-40a6-a6d0-f00fdc0e4e3c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof64fc5aa-eb34-40a6-a6d0-f00fdc0e4e3c.labels" -}}
helm.sh/chart: {{ include "go-echof64fc5aa-eb34-40a6-a6d0-f00fdc0e4e3c.chart" . }}
{{ include "go-echof64fc5aa-eb34-40a6-a6d0-f00fdc0e4e3c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof64fc5aa-eb34-40a6-a6d0-f00fdc0e4e3c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof64fc5aa-eb34-40a6-a6d0-f00fdc0e4e3c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}