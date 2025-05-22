
{{- define "go-echofb328482-d254-4756-8c3d-751fe842cfcd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb328482-d254-4756-8c3d-751fe842cfcd.fullname" -}}
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


{{- define "go-echofb328482-d254-4756-8c3d-751fe842cfcd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb328482-d254-4756-8c3d-751fe842cfcd.labels" -}}
helm.sh/chart: {{ include "go-echofb328482-d254-4756-8c3d-751fe842cfcd.chart" . }}
{{ include "go-echofb328482-d254-4756-8c3d-751fe842cfcd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofb328482-d254-4756-8c3d-751fe842cfcd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofb328482-d254-4756-8c3d-751fe842cfcd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}