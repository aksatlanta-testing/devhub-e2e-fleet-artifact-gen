
{{- define "go-echodf5ffcb9-7402-4b4c-b3d6-2db66b26c74a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf5ffcb9-7402-4b4c-b3d6-2db66b26c74a.fullname" -}}
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


{{- define "go-echodf5ffcb9-7402-4b4c-b3d6-2db66b26c74a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf5ffcb9-7402-4b4c-b3d6-2db66b26c74a.labels" -}}
helm.sh/chart: {{ include "go-echodf5ffcb9-7402-4b4c-b3d6-2db66b26c74a.chart" . }}
{{ include "go-echodf5ffcb9-7402-4b4c-b3d6-2db66b26c74a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodf5ffcb9-7402-4b4c-b3d6-2db66b26c74a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodf5ffcb9-7402-4b4c-b3d6-2db66b26c74a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}