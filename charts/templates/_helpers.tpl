
{{- define "go-echofba2f1f7-493e-4380-8bb2-3aa740a3403b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofba2f1f7-493e-4380-8bb2-3aa740a3403b.fullname" -}}
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


{{- define "go-echofba2f1f7-493e-4380-8bb2-3aa740a3403b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofba2f1f7-493e-4380-8bb2-3aa740a3403b.labels" -}}
helm.sh/chart: {{ include "go-echofba2f1f7-493e-4380-8bb2-3aa740a3403b.chart" . }}
{{ include "go-echofba2f1f7-493e-4380-8bb2-3aa740a3403b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofba2f1f7-493e-4380-8bb2-3aa740a3403b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofba2f1f7-493e-4380-8bb2-3aa740a3403b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}