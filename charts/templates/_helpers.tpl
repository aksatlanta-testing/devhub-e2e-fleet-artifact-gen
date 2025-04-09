
{{- define "go-echoc82e8c6d-2861-4aa2-8157-413b2763e01a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc82e8c6d-2861-4aa2-8157-413b2763e01a.fullname" -}}
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


{{- define "go-echoc82e8c6d-2861-4aa2-8157-413b2763e01a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc82e8c6d-2861-4aa2-8157-413b2763e01a.labels" -}}
helm.sh/chart: {{ include "go-echoc82e8c6d-2861-4aa2-8157-413b2763e01a.chart" . }}
{{ include "go-echoc82e8c6d-2861-4aa2-8157-413b2763e01a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc82e8c6d-2861-4aa2-8157-413b2763e01a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc82e8c6d-2861-4aa2-8157-413b2763e01a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}