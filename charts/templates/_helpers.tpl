
{{- define "go-echo44f82049-d29d-440e-a43c-e44088d3add6.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo44f82049-d29d-440e-a43c-e44088d3add6.fullname" -}}
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


{{- define "go-echo44f82049-d29d-440e-a43c-e44088d3add6.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo44f82049-d29d-440e-a43c-e44088d3add6.labels" -}}
helm.sh/chart: {{ include "go-echo44f82049-d29d-440e-a43c-e44088d3add6.chart" . }}
{{ include "go-echo44f82049-d29d-440e-a43c-e44088d3add6.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo44f82049-d29d-440e-a43c-e44088d3add6.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo44f82049-d29d-440e-a43c-e44088d3add6.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}