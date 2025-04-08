
{{- define "go-echofb40ca17-dfd5-443e-9ff5-6983f7267b1e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb40ca17-dfd5-443e-9ff5-6983f7267b1e.fullname" -}}
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


{{- define "go-echofb40ca17-dfd5-443e-9ff5-6983f7267b1e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb40ca17-dfd5-443e-9ff5-6983f7267b1e.labels" -}}
helm.sh/chart: {{ include "go-echofb40ca17-dfd5-443e-9ff5-6983f7267b1e.chart" . }}
{{ include "go-echofb40ca17-dfd5-443e-9ff5-6983f7267b1e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofb40ca17-dfd5-443e-9ff5-6983f7267b1e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofb40ca17-dfd5-443e-9ff5-6983f7267b1e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}